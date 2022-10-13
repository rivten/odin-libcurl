package tests

import "core:fmt"
import "core:c"
import "core:runtime"
import "core:strings"
import curl ".."

t :: proc "c" (data: rawptr, size: c.size_t, nmemb: c.size_t, userdata: rawptr) -> c.size_t {
    c := (^runtime.Context)(userdata)
    context = c^
    data := strings.string_from_ptr((^u8)(data), (int)(size * nmemb))
    fmt.println(data)
    return size * nmemb
}

main :: proc() {
    handle := curl.easy_init()
    assert(handle != nil)

    url := "data to convert"
    url_encoded := curl.easy_escape(nil, strings.ptr_from_string(url), len(url))
    fmt.println(url_encoded)
    curl.free(url_encoded)

    headers : ^curl.SList
    headers = curl.slist_append(headers, strings.ptr_from_string("Content-Type: application/json"))

    curl.easy_setopt(handle, curl.CurlOption.URL, "https://httpbin.org/anything")
    curl.easy_setopt(handle, curl.CurlOption.POST, (c.long)(1))
    curl.easy_setopt(handle, curl.CurlOption.POSTFIELDS, "{\"wonderful\":\"test\"}")
    curl.easy_setopt(handle, curl.CurlOption.WRITEFUNCTION, t)
    curl.easy_setopt(handle, curl.CurlOption.VERBOSE, (c.long)(1))
    curl.easy_setopt(handle, curl.CurlOption.HTTPHEADER, headers)
    c := context
    curl.easy_setopt(handle, curl.CurlOption.WRITEDATA, &c)
    res := curl.easy_perform(handle)

    if res != curl.CurlCode.OK {
        fmt.panicf("curl.easy_perform() has failed: %s", curl.easy_strerror(res))
    }
    curl.easy_cleanup(handle)
}
