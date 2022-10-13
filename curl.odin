package curl

import "core:c"

when ODIN_OS == .Linux do foreign import libcurl "system:curl"

Curl :: rawptr

CurlCode :: enum i32 {
    OK = 0,
    UNSUPPORTED_PROTOCOL,    /* 1 */
    FAILED_INIT,             /* 2 */
    URL_MALFORMAT,           /* 3 */
    NOT_BUILT_IN,            /* 4 - [was obsoleted in August 2007 for
                                    7.17.0, reused in April 2011 for 7.21.5] */
    COULDNT_RESOLVE_PROXY,   /* 5 */
    COULDNT_RESOLVE_HOST,    /* 6 */
    COULDNT_CONNECT,         /* 7 */
    WEIRD_SERVER_REPLY,      /* 8 */
    REMOTE_ACCESS_DENIED,    /* 9 a service was denied by the server
                                    due to lack of access - when login fails
                                    this is not returned. */
    FTP_ACCEPT_FAILED,       /* 10 - [was obsoleted in April 2006 for
                                    7.15.4, reused in Dec 2011 for 7.24.0]*/
    FTP_WEIRD_PASS_REPLY,    /* 11 */
    FTP_ACCEPT_TIMEOUT,      /* 12 - timeout occurred accepting server
                                    [was obsoleted in August 2007 for 7.17.0,
                                    reused in Dec 2011 for 7.24.0]*/
    FTP_WEIRD_PASV_REPLY,    /* 13 */
    FTP_WEIRD_227_FORMAT,    /* 14 */
    FTP_CANT_GET_HOST,       /* 15 */
    HTTP2,                   /* 16 - A problem in the http2 framing layer.
                                    [was obsoleted in August 2007 for 7.17.0,
                                    reused in July 2014 for 7.38.0] */
    FTP_COULDNT_SET_TYPE,    /* 17 */
    PARTIAL_FILE,            /* 18 */
    FTP_COULDNT_RETR_FILE,   /* 19 */
    OBSOLETE20,              /* 20 - NOT USED */
    QUOTE_ERROR,             /* 21 - quote command failure */
    HTTP_RETURNED_ERROR,     /* 22 */
    WRITE_ERROR,             /* 23 */
    OBSOLETE24,              /* 24 - NOT USED */
    UPLOAD_FAILED,           /* 25 - failed upload "command" */
    READ_ERROR,              /* 26 - couldn't open/read from file */
    OUT_OF_MEMORY,           /* 27 */
    /* Note: OUT_OF_MEMORY may sometimes indicate a conversion error
           instead of a memory allocation error if CURL_DOES_CONVERSIONS
           is defined
    */
    OPERATION_TIMEDOUT,      /* 28 - the timeout time was reached */
    OBSOLETE29,              /* 29 - NOT USED */
    FTP_PORT_FAILED,         /* 30 - FTP PORT operation failed */
    FTP_COULDNT_USE_REST,    /* 31 - the REST command failed */
    OBSOLETE32,              /* 32 - NOT USED */
    RANGE_ERROR,             /* 33 - RANGE "command" didn't work */
    HTTP_POST_ERROR,         /* 34 */
    SSL_CONNECT_ERROR,       /* 35 - wrong when connecting with SSL */
    BAD_DOWNLOAD_RESUME,     /* 36 - couldn't resume download */
    FILE_COULDNT_READ_FILE,  /* 37 */
    LDAP_CANNOT_BIND,        /* 38 */
    LDAP_SEARCH_FAILED,      /* 39 */
    OBSOLETE40,              /* 40 - NOT USED */
    FUNCTION_NOT_FOUND,      /* 41 - NOT USED starting with 7.53.0 */
    ABORTED_BY_CALLBACK,     /* 42 */
    BAD_FUNCTION_ARGUMENT,   /* 43 */
    OBSOLETE44,              /* 44 - NOT USED */
    INTERFACE_FAILED,        /* 45 - CURLOPT_INTERFACE failed */
    OBSOLETE46,              /* 46 - NOT USED */
    TOO_MANY_REDIRECTS,      /* 47 - catch endless re-direct loops */
    UNKNOWN_OPTION,          /* 48 - User specified an unknown option */
    TELNET_OPTION_SYNTAX,    /* 49 - Malformed telnet option */
    OBSOLETE50,              /* 50 - NOT USED */
    PEER_FAILED_VERIFICATION, /* 51 - peer's certificate or fingerprint
                                     wasn't verified fine */
    GOT_NOTHING,             /* 52 - when this is a specific error */
    SSL_ENGINE_NOTFOUND,     /* 53 - SSL crypto engine not found */
    SSL_ENGINE_SETFAILED,    /* 54 - can not set SSL crypto engine as
                                    default */
    SEND_ERROR,              /* 55 - failed sending network data */
    RECV_ERROR,              /* 56 - failure in receiving network data */
    OBSOLETE57,              /* 57 - NOT IN USE */
    SSL_CERTPROBLEM,         /* 58 - problem with the local certificate */
    SSL_CIPHER,              /* 59 - couldn't use specified cipher */
    SSL_CACERT,              /* 60 - problem with the CA cert (path?) */
    BAD_CONTENT_ENCODING,    /* 61 - Unrecognized/bad encoding */
    LDAP_INVALID_URL,        /* 62 - Invalid LDAP URL */
    FILESIZE_EXCEEDED,       /* 63 - Maximum file size exceeded */
    USE_SSL_FAILED,          /* 64 - Requested FTP SSL level failed */
    SEND_FAIL_REWIND,        /* 65 - Sending the data requires a rewind
                                    that failed */
    SSL_ENGINE_INITFAILED,   /* 66 - failed to initialise ENGINE */
    LOGIN_DENIED,            /* 67 - user, password or similar was not
                                    accepted and we failed to login */
    TFTP_NOTFOUND,           /* 68 - file not found on server */
    TFTP_PERM,               /* 69 - permission problem on server */
    REMOTE_DISK_FULL,        /* 70 - out of disk space on server */
    TFTP_ILLEGAL,            /* 71 - Illegal TFTP operation */
    TFTP_UNKNOWNID,          /* 72 - Unknown transfer ID */
    REMOTE_FILE_EXISTS,      /* 73 - File already exists */
    TFTP_NOSUCHUSER,         /* 74 - No such user */
    CONV_FAILED,             /* 75 - conversion failed */
    CONV_REQD,               /* 76 - caller must register conversion
                                    callbacks using curl_easy_setopt options
                                    CURLOPT_CONV_FROM_NETWORK_FUNCTION,
                                    CURLOPT_CONV_TO_NETWORK_FUNCTION, and
                                    CURLOPT_CONV_FROM_UTF8_FUNCTION */
    SSL_CACERT_BADFILE,      /* 77 - could not load CACERT file, missing
                                    or wrong format */
    REMOTE_FILE_NOT_FOUND,   /* 78 - remote file not found */
    SSH,                     /* 79 - error from the SSH layer, somewhat
                                    generic so the error message will be of
                                    interest when this has happened */

    SSL_SHUTDOWN_FAILED,     /* 80 - Failed to shut down the SSL
                                    connection */
    AGAIN,                   /* 81 - socket is not ready for send/recv,
                                    wait till it's ready and try again (Added
                                    in 7.18.2) */
    SSL_CRL_BADFILE,         /* 82 - could not load CRL file, missing or
                                    wrong format (Added in 7.19.0) */
    SSL_ISSUER_ERROR,        /* 83 - Issuer check failed.  (Added in
                                    7.19.0) */
    FTP_PRET_FAILED,         /* 84 - a PRET command failed */
    RTSP_CSEQ_ERROR,         /* 85 - mismatch of RTSP CSeq numbers */
    RTSP_SESSION_ERROR,      /* 86 - mismatch of RTSP Session Ids */
    FTP_BAD_FILE_LIST,       /* 87 - unable to parse FTP file list */
    CHUNK_FAILED,            /* 88 - chunk callback reported error */
    NO_CONNECTION_AVAILABLE, /* 89 - No connection available, the
                                    session will be queued */
    SSL_PINNEDPUBKEYNOTMATCH, /* 90 - specified pinned public key did not
                                     match */
    SSL_INVALIDCERTSTATUS,   /* 91 - invalid certificate status */
    HTTP2_STREAM,            /* 92 - stream error in HTTP/2 framing layer
                                    */
    RECURSIVE_API_CALL,      /* 93 - an api function was called from
                                    inside a callback */
    CURL_LAST, /* never use! */
}

CurlOption :: enum i32 {
    /* long may be 32 or 64 bits, but we should never depend on anything else
    but 32 */
    /* *STRINGPOINT is an alias for OBJECTPOINT to allow tools to extract the
       string options from the header file */
    // These are the base values into which the individual enums are categorized:
    LONG          = 0,
    OBJECTPOINT   = 10000,
    STRINGPOINT   = 10000,
    FUNCTIONPOINT = 20000,
    OFF_T         = 30000,

    // Here are the individual enums:

    /* This is the FILE * or void * the regular output should be written to. */
    WRITEDATA = OBJECTPOINT + 1,

    /* The full URL to get/put */
    URL = OBJECTPOINT + 2,

    /* Port number to connect to, if other than default. */
    PORT = LONG + 3,

    /* Name of proxy to use. */
    PROXY = OBJECTPOINT + 4,

    /* "user:passwordoptions" to use when fetching. */
    USERPWD = OBJECTPOINT + 5,

    /* "user:password" to use with proxy. */
    PROXYUSERPWD = OBJECTPOINT + 6,

    /* Range to get, specified as an ASCII string. */
    RANGE = OBJECTPOINT + 7,

    /* not used */

    /* Specified file stream to upload from (use as input): */
    READDATA = OBJECTPOINT + 9,

    /* Buffer to receive error messages in, must be at least CURL_ERROR_SIZE
    * bytes big. */
    ERRORBUFFER = OBJECTPOINT + 10,

    /* Function that will be called to store the output (instead of fwrite). The
    * parameters will use fwrite() syntax, make sure to follow them. */
    WRITEFUNCTION = FUNCTIONPOINT + 11,

    /* Function that will be called to read the input (instead of fread). The
    * parameters will use fread() syntax, make sure to follow them. */
    READFUNCTION = FUNCTIONPOINT + 12,

    /* Time-out the read operation after this amount of seconds */
    TIMEOUT = LONG + 13,

    /* If the INFILE is used, this can be used to inform libcurl about
    * how large the file being sent really is. That allows better error
    * checking and better verifies that the upload was successful. -1 means
    * unknown size.
    *
    * For large file support, there is also a _LARGE version of the key
    * which takes an off_t type, allowing platforms with larger off_t
    * sizes to handle larger files.  See below for INFILESIZE_LARGE.
    */
    INFILESIZE = LONG + 14,

    /* POST static input fields. */
    POSTFIELDS = OBJECTPOINT + 15,

    /* Set the referrer page (needed by some CGIs) */
    REFERER = OBJECTPOINT + 16,

    /* Set the FTP PORT string (interface name, named or numerical IP address)
     Use i.e '-' to use default address. */
    FTPPORT = OBJECTPOINT + 17,

    /* Set the User-Agent string (examined by some CGIs) */
    USERAGENT = OBJECTPOINT + 18,

    /* If the download receives less than "low speed limit" bytes/second
    * during "low speed time" seconds, the operations is aborted.
    * You could i.e if you have a pretty high speed connection, abort if
    * it is less than 2000 bytes/sec during 20 seconds.
    */

    /* Set the "low speed limit" */
    LOW_SPEED_LIMIT = LONG + 19,

    /* Set the "low speed time" */
    LOW_SPEED_TIME = LONG + 20,

    /* Set the continuation offset.
    *
    * Note there is also a _LARGE version of this key which uses
    * off_t types, allowing for large file offsets on platforms which
    * use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.
    */
    RESUME_FROM = LONG + 21,

    /* Set cookie in request: */
    COOKIE = OBJECTPOINT + 22,

    /* This points to a linked list of headers, struct curl_slist kind. This
     list is also used for RTSP (in spite of its name) */
    HTTPHEADER = OBJECTPOINT + 23,

    /* This points to a linked list of post entries, struct curl_httppost */
    HTTPPOST = OBJECTPOINT + 24,

    /* name of the file keeping your private SSL-certificate */
    SSLCERT = OBJECTPOINT + 25,

    /* password for the SSL or SSH private key */
    KEYPASSWD = OBJECTPOINT + 26,

    /* send TYPE parameter? */
    CRLF = LONG + 27,

    /* send linked-list of QUOTE commands */
    QUOTE = OBJECTPOINT + 28,

    /* send FILE * or void * to store headers to, if you use a callback it
     is simply passed to the callback unmodified */
    HEADERDATA = OBJECTPOINT + 29,

    /* point to a file to read the initial cookies from, also enables
     "cookie awareness" */
    COOKIEFILE = OBJECTPOINT + 31,

    /* What version to specifically try to use.
     See CURL_SSLVERSION defines below. */
    SSLVERSION = LONG + 32,

    /* What kind of HTTP time condition to use, see defines */
    TIMECONDITION = LONG + 33,

    /* Time to use with the above condition. Specified in number of seconds
     since 1 Jan 1970 */
    TIMEVALUE = LONG + 34,

    /* 35 = OBSOLETE */

    /* Custom request, for customizing the get command like
     HTTP: DELETE, TRACE and others
     FTP: to use a different list command
     */
    CUSTOMREQUEST = OBJECTPOINT + 36,

    /* FILE handle to use instead of stderr */
    STDERR = OBJECTPOINT + 37,

    /* 38 is not used */

    /* send linked-list of post-transfer QUOTE commands */
    POSTQUOTE = OBJECTPOINT + 39,

    OBSOLETE40 = OBJECTPOINT + 40, /* OBSOLETE, do not use! */

    VERBOSE = LONG + 41, /* talk a lot */

    HEADER = LONG + 42, /* throw the header out too */

    NOPROGRESS = LONG + 43, /* shut off the progress meter */

    NOBODY = LONG + 44, /* use HEAD to get http document */

    FAILONERROR = LONG + 45, /* no output on http error codes >= 400 */

    UPLOAD = LONG + 46, /* this is an upload */

    POST = LONG + 47, /* HTTP POST method */

    DIRLISTONLY = LONG + 48, /* bare names when listing directories */

    /* not used ? */

    APPEND = LONG + 50, /* Append instead of overwrite on upload! */

    /* Specify whether to read the user+password from the .netrc or the URL.
    * This must be one of the CURL_NETRC_* enums below. */
    NETRC = LONG + 51,

    FOLLOWLOCATION = LONG + 52, /* use Location: Luke! */

    TRANSFERTEXT = LONG + 53, /* transfer data in text/ASCII format */

    PUT = LONG + 54, /* HTTP PUT */

    /* 55 = OBSOLETE */

    /* DEPRECATED
    * Function that will be called instead of the internal progress display
    * function. This function should be defined as the curl_progress_callback
    * prototype defines. */
    PROGRESSFUNCTION = FUNCTIONPOINT + 56,

    /* Data passed to the PROGRESSFUNCTION and XFERINFOFUNCTION
     callbacks */
    PROGRESSDATA = OBJECTPOINT + 57,

    /* We want the referrer field set automatically when following locations */
    AUTOREFERER = LONG + 58,

    /* Port of the proxy, can be set in the proxy string as well with:
     "[host]:[port]" */
    PROXYPORT = LONG + 59,

    /* size of the POST input data, if strlen() is not good to use */
    POSTFIELDSIZE = LONG + 60,

    /* tunnel non-http operations through a HTTP proxy */
    HTTPPROXYTUNNEL = LONG + 61,

    /* Set the interface string to use as outgoing network interface */
    INTERFACE = OBJECTPOINT + 62,

    /* Set the krb4/5 security level, this also enables krb4/5 awareness.  This
    * is a string, 'clear', 'safe', 'confidential' or 'private'.  If the string
    * is set but doesn't match one of these, 'private' will be used.  */
    KRBLEVEL = OBJECTPOINT + 63,

    /* Set if we should verify the peer in ssl handshake, set 1 to verify. */
    SSL_VERIFYPEER = LONG + 64,

    /* The CApath or CAfile used to validate the peer certificate
     this option is used only if SSL_VERIFYPEER is true */
    CAINFO = OBJECTPOINT + 65,

    /* 66 = OBSOLETE */
    /* 67 = OBSOLETE */

    /* Maximum number of http redirects to follow */
    MAXREDIRS = LONG + 68,

    /* Pass a long set to 1 to get the date of the requested document (if
     possible)! Pass a zero to shut it off. */
    FILETIME = LONG + 69,

    /* This points to a linked list of telnet options */
    TELNETOPTIONS = OBJECTPOINT + 70,

    /* Max amount of cached alive connections */
    MAXCONNECTS = LONG + 71,

    OBSOLETE72 = LONG + 72, /* OBSOLETE, do not use! */

    /* 73 = OBSOLETE */

    /* Set to explicitly use a new connection for the upcoming transfer.
     Do not use this unless you're absolutely sure of this, as it makes the
     operation slower and is less friendly for the network. */
    FRESH_CONNECT = LONG + 74,

    /* Set to explicitly forbid the upcoming transfer's connection to be re-used
     when done. Do not use this unless you're absolutely sure of this, as it
     makes the operation slower and is less friendly for the network. */
    FORBID_REUSE = LONG + 75,

    /* Set to a file name that contains random data for libcurl to use to
     seed the random engine when doing SSL connects. */
    RANDOM_FILE = OBJECTPOINT + 76,

    /* Set to the Entropy Gathering Daemon socket pathname */
    EGDSOCKET = OBJECTPOINT + 77,

    /* Time-out connect operations after this amount of seconds, if connects are
     OK within this time, then fine... This only aborts the connect phase. */
    CONNECTTIMEOUT = LONG + 78,

    /* Function that will be called to store headers (instead of fwrite). The
    * parameters will use fwrite() syntax, make sure to follow them. */
    HEADERFUNCTION = FUNCTIONPOINT + 79,

    /* Set this to force the HTTP request to get back to GET. Only really usable
     if POST, PUT or a custom request have been used first.
    */
    HTTPGET = LONG + 80,

    /* Set if we should verify the Common name from the peer certificate in ssl
    * handshake, set 1 to check existence, 2 to ensure that it matches the
    * provided hostname. */
    SSL_VERIFYHOST = LONG + 81,

    /* Specify which file name to write all known cookies in after completed
     operation. Set file name to "-" (dash) to make it go to stdout. */
    COOKIEJAR = OBJECTPOINT + 82,

    /* Specify which SSL ciphers to use */
    SSL_CIPHER_LIST = OBJECTPOINT + 83,

    /* Specify which HTTP version to use! This must be set to one of the
     CURL_HTTP_VERSION* enums set below. */
    HTTP_VERSION = LONG + 84,

    /* Specifically switch on or off the FTP engine's use of the EPSV command. By
     default, that one will always be attempted before the more traditional
     PASV command. */
    FTP_USE_EPSV = LONG + 85,

    /* type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") */
    SSLCERTTYPE = OBJECTPOINT + 86,

    /* name of the file keeping your private SSL-key */
    SSLKEY = OBJECTPOINT + 87,

    /* type of the file keeping your private SSL-key ("DER", "PEM", "ENG") */
    SSLKEYTYPE = OBJECTPOINT + 88,

    /* crypto engine for the SSL-sub system */
    SSLENGINE = OBJECTPOINT + 89,

    /* set the crypto engine for the SSL-sub system as default
     the param has no meaning...
    */
    SSLENGINE_DEFAULT = LONG + 90,

    /* Non-zero value means to use the global dns cache */
    DNS_USE_GLOBAL_CACHE = LONG + 91,

    /* DNS cache timeout */
    DNS_CACHE_TIMEOUT = LONG + 92,

    /* send linked-list of pre-transfer QUOTE commands */
    PREQUOTE = OBJECTPOINT + 93,

    /* set the debug function */
    DEBUGFUNCTION = FUNCTIONPOINT + 94,

    /* set the data for the debug function */
    DEBUGDATA = OBJECTPOINT + 95,

    /* mark this as start of a cookie session */
    COOKIESESSION = LONG + 96,

    /* The CApath directory used to validate the peer certificate
     this option is used only if SSL_VERIFYPEER is true */
    CAPATH = OBJECTPOINT + 97,

    /* Instruct libcurl to use a smaller receive buffer */
    BUFFERSIZE = LONG + 98,

    /* Instruct libcurl to not use any signal/alarm handlers, even when using
     timeouts. This option is useful for multi-threaded applications.
     See libcurl-the-guide for more background information. */
    NOSIGNAL = LONG + 99,

    /* Provide a CURLShare for mutexing non-ts data */
    SHARE = OBJECTPOINT + 100,

    /* indicates type of proxy. accepted values are CURLPROXY_HTTP (default),
     CURLPROXY_HTTPS, CURLPROXY_SOCKS4, CURLPROXY_SOCKS4A and
     CURLPROXY_SOCKS5. */
    PROXYTYPE = LONG + 101,

    /* Set the Accept-Encoding string. Use this to tell a server you would like
     the response to be compressed. Before 7.21.6, this was known as
     ENCODING */
    ACCEPT_ENCODING = OBJECTPOINT + 102,

    /* Set pointer to private data */
    PRIVATE = OBJECTPOINT + 103,

    /* Set aliases for HTTP 200 in the HTTP Response header */
    HTTP200ALIASES = OBJECTPOINT + 104,

    /* Continue to send authentication (user+password) when following locations,
     even when hostname changed. This can potentially send off the name
     and password to whatever host the server decides. */
    UNRESTRICTED_AUTH = LONG + 105,

    /* Specifically switch on or off the FTP engine's use of the EPRT command (
     it also disables the LPRT attempt). By default, those ones will always be
     attempted before the good old traditional PORT command. */
    FTP_USE_EPRT = LONG + 106,

    /* Set this to a bitmask value to enable the particular authentications
     methods you like. Use this in combination with USERPWD.
     Note that setting multiple bits may cause extra network round-trips. */
    HTTPAUTH = LONG + 107,

    /* Set the ssl context callback function, currently only for OpenSSL ssl_ctx
     in second argument. The function must be matching the
     curl_ssl_ctx_callback proto. */
    SSL_CTX_FUNCTION = FUNCTIONPOINT + 108,

    /* Set the userdata for the ssl context callback function's third
     argument */
    SSL_CTX_DATA = OBJECTPOINT + 109,

    /* FTP Option that causes missing dirs to be created on the remote server.
     In 7.19.4 we introduced the convenience enums for this option using the
     CURLFTP_CREATE_DIR prefix.
    */
    FTP_CREATE_MISSING_DIRS = LONG + 110,

    /* Set this to a bitmask value to enable the particular authentications
     methods you like. Use this in combination with PROXYUSERPWD.
     Note that setting multiple bits may cause extra network round-trips. */
    PROXYAUTH = LONG + 111,

    /* FTP option that changes the timeout, in seconds, associated with
     getting a response.  This is different from transfer timeout time and
     essentially places a demand on the FTP server to acknowledge commands
     in a timely manner. */
    FTP_RESPONSE_TIMEOUT = LONG + 112,

    /* Set this option to one of the CURL_IPRESOLVE_* defines (see below) to
     tell libcurl to resolve names to those IP versions only. This only has
     affect on systems with support for more than one, i.e IPv4 _and_ IPv6. */
    IPRESOLVE = LONG + 113,

    /* Set this option to limit the size of a file that will be downloaded from
     an HTTP or FTP server.

     Note there is also _LARGE version which adds large file support for
     platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below. */
    MAXFILESIZE = LONG + 114,

    /* See the comment for INFILESIZE above, but in short, specifies
    * the size of the file being uploaded.  -1 means unknown.
    */
    INFILESIZE_LARGE = OFF_T + 115,

    /* Sets the continuation offset.  There is also a LONG version of this
    * look above for RESUME_FROM.
    */
    RESUME_FROM_LARGE = OFF_T + 116,

    /* Sets the maximum size of data that will be downloaded from
    * an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.
    */
    MAXFILESIZE_LARGE = OFF_T + 117,

    /* Set this option to the file name of your .netrc file you want libcurl
     to parse (using the NETRC option). If not set, libcurl will do
     a poor attempt to find the user's home directory and check for a .netrc
     file in there. */
    NETRC_FILE = OBJECTPOINT + 118,

    /* Enable SSL/TLS for FTP, pick one of:
     TRY     - try using SSL, proceed anyway otherwise
     CONTROL - SSL for the control connection or fail
     ALL     - SSL for all communication or fail
    */
    USE_SSL = LONG + 119,

    /* The _LARGE version of the standard POSTFIELDSIZE option */
    POSTFIELDSIZE_LARGE = OFF_T + 120,

    /* Enable/disable the TCP Nagle algorithm */
    TCP_NODELAY = LONG + 121,

    /* 122 OBSOLETE, used in 7.12.3. Gone in 7.13.0 */
    /* 123 OBSOLETE. Gone in 7.16.0 */
    /* 124 OBSOLETE, used in 7.12.3. Gone in 7.13.0 */
    /* 125 OBSOLETE, used in 7.12.3. Gone in 7.13.0 */
    /* 126 OBSOLETE, used in 7.12.3. Gone in 7.13.0 */
    /* 127 OBSOLETE. Gone in 7.16.0 */
    /* 128 OBSOLETE. Gone in 7.16.0 */

    /* When FTP over SSL/TLS is selected (with USE_SSL), this option
     can be used to change libcurl's default action which is to first try
     "AUTH SSL" and then "AUTH TLS" in this order, and proceed when a OK
     response has been received.

     Available parameters are:
     CURLFTPAUTH_DEFAULT - let libcurl decide
     CURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
     CURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL
    */
    FTPSSLAUTH = LONG + 129,

    IOCTLFUNCTION = FUNCTIONPOINT + 130,

    IOCTLDATA = OBJECTPOINT + 131,

    /* 132 OBSOLETE. Gone in 7.16.0 */
    /* 133 OBSOLETE. Gone in 7.16.0 */

    /* zero terminated string for pass on to the FTP server when asked for
     "account" info */
    FTP_ACCOUNT = OBJECTPOINT + 134,

    /* feed cookie into cookie engine */
    COOKIELIST = OBJECTPOINT + 135,

    /* ignore Content-Length */
    IGNORE_CONTENT_LENGTH = LONG + 136,

    /* Set to non-zero to skip the IP address received in a 227 PASV FTP server
     response. Typically used for FTP-SSL purposes but is not restricted to
     that. libcurl will then instead use the same IP address it used for the
     control connection. */
    FTP_SKIP_PASV_IP = LONG + 137,

    /* Select "file method" to use when doing FTP, see the curl_ftpmethod
     above. */
    FTP_FILEMETHOD = LONG + 138,

    /* Local port number to bind the socket to */
    LOCALPORT = LONG + 139,

    /* Number of ports to try, including the first one set with LOCALPORT.
     Thus, setting it to 1 will make no additional attempts but the first.
    */
    LOCALPORTRANGE = LONG + 140,

    /* no transfer, set up connection and let application use the socket by
     extracting it with LASTSOCKET */
    CONNECT_ONLY = LONG + 141,

    /* Function that will be called to convert from the
     network encoding (instead of using the iconv calls in libcurl) */
    CONV_FROM_NETWORK_FUNCTION = FUNCTIONPOINT + 142,

    /* Function that will be called to convert to the
     network encoding (instead of using the iconv calls in libcurl) */
    CONV_TO_NETWORK_FUNCTION = FUNCTIONPOINT + 143,

    /* Function that will be called to convert from UTF8
     (instead of using the iconv calls in libcurl)
     Note that this is used only for SSL certificate processing */
    CONV_FROM_UTF8_FUNCTION = FUNCTIONPOINT + 144,

    /* if the connection proceeds too quickly then need to slow it down */
    /* limit-rate: maximum number of bytes per second to send or receive */
    MAX_SEND_SPEED_LARGE = OFF_T + 145,
    MAX_RECV_SPEED_LARGE = OFF_T + 146,

    /* Pointer to command string to send if USER/PASS fails. */
    FTP_ALTERNATIVE_TO_USER = OBJECTPOINT + 147,

    /* callback function for setting socket options */
    SOCKOPTFUNCTION = FUNCTIONPOINT + 148,
    SOCKOPTDATA = OBJECTPOINT + 149,

    /* set to 0 to disable session ID re-use for this transfer, default is
     enabled (== 1) */
    SSL_SESSIONID_CACHE = LONG + 150,

    /* allowed SSH authentication methods */
    SSH_AUTH_TYPES = LONG + 151,

    /* Used by scp/sftp to do public/private key authentication */
    SSH_PUBLIC_KEYFILE = OBJECTPOINT + 152,
    SSH_PRIVATE_KEYFILE = OBJECTPOINT + 153,

    /* Send CCC (Clear Command Channel) after authentication */
    FTP_SSL_CCC = LONG + 154,

    /* Same as TIMEOUT and CONNECTTIMEOUT, but with ms resolution */
    TIMEOUT_MS = LONG + 155,
    CONNECTTIMEOUT_MS = LONG + 156,

    /* set to zero to disable the libcurl's decoding and thus pass the raw body
     data to the application even when it is encoded/compressed */
    HTTP_TRANSFER_DECODING = LONG + 157,
    HTTP_CONTENT_DECODING = LONG + 158,

    /* Permission used when creating new files and directories on the remote
     server for protocols that support it, SFTP/SCP/FILE */
    NEW_FILE_PERMS = LONG + 159,
    NEW_DIRECTORY_PERMS = LONG + 160,

    /* Set the behaviour of POST when redirecting. Values must be set to one
     of CURL_REDIR* defines below. This used to be called POST301 */
    POSTREDIR = LONG + 161,

    /* used by scp/sftp to verify the host's public key */
    SSH_HOST_PUBLIC_KEY_MD5 = OBJECTPOINT + 162,

    /* Callback function for opening socket (instead of socket(2)). Optionally,
     callback is able change the address or refuse to connect returning
     CURL_SOCKET_BAD.  The callback should have type
     curl_opensocket_callback */
    OPENSOCKETFUNCTION = FUNCTIONPOINT + 163,
    OPENSOCKETDATA = OBJECTPOINT + 164,

    /* POST volatile input fields. */
    COPYPOSTFIELDS = OBJECTPOINT + 165,

    /* set transfer mode (type=<a|i>) when doing FTP via an HTTP proxy */
    PROXY_TRANSFER_MODE = LONG + 166,

    /* Callback function for seeking in the input stream */
    SEEKFUNCTION = FUNCTIONPOINT + 167,
    SEEKDATA = OBJECTPOINT + 168,

    /* CRL file */
    CRLFILE = OBJECTPOINT + 169,

    /* Issuer certificate */
    ISSUERCERT = OBJECTPOINT + 170,

    /* (IPv6) Address scope */
    ADDRESS_SCOPE = LONG + 171,

    /* Collect certificate chain info and allow it to get retrievable with
     CERTINFO after the transfer is complete. */
    CERTINFO = LONG + 172,

    /* "name" and "pwd" to use when fetching. */
    USERNAME = OBJECTPOINT + 173,
    PASSWORD = OBJECTPOINT + 174,

    /* "name" and "pwd" to use with Proxy when fetching. */
    PROXYUSERNAME = OBJECTPOINT + 175,
    PROXYPASSWORD = OBJECTPOINT + 176,

    /* Comma separated list of hostnames defining no-proxy zones. These should
     match both hostnames directly, and hostnames within a domain. For
     example, local.com will match local.com and www.local.com, but NOT
     notlocal.com or www.notlocal.com. For compatibility with other
     implementations of this, .local.com will be considered to be the same as
     local.com. A single * is the only valid wildcard, and effectively
     disables the use of proxy. */
    NOPROXY = OBJECTPOINT + 177,

    /* block size for TFTP transfers */
    TFTP_BLKSIZE = LONG + 178,

    /* Socks Service */
    SOCKS5_GSSAPI_SERVICE = OBJECTPOINT + 179,

    /* Socks Service */
    SOCKS5_GSSAPI_NEC = LONG + 180,

    /* set the bitmask for the protocols that are allowed to be used for the
     transfer, which thus helps the app which takes URLs from users or other
     external inputs and want to restrict what protocol(s) to deal
     with. Defaults to CURLPROTO_ALL. */
    PROTOCOLS = LONG + 181,

    /* set the bitmask for the protocols that libcurl is allowed to follow to,
     as a subset of the PROTOCOLS ones. That means the protocol needs
     to be set in both bitmasks to be allowed to get redirected to. Defaults
     to all protocols except FILE and SCP. */
    REDIR_PROTOCOLS = LONG + 182,

    /* set the SSH knownhost file name to use */
    SSH_KNOWNHOSTS = OBJECTPOINT + 183,

    /* set the SSH host key callback, must point to a curl_sshkeycallback
     function */
    SSH_KEYFUNCTION = FUNCTIONPOINT + 184,

    /* set the SSH host key callback custom pointer */
    SSH_KEYDATA = OBJECTPOINT + 185,

    /* set the SMTP mail originator */
    MAIL_FROM = OBJECTPOINT + 186,

    /* set the list of SMTP mail receiver(s) */
    MAIL_RCPT = OBJECTPOINT + 187,

    /* FTP: send PRET before PASV */
    FTP_USE_PRET = LONG + 188,

    /* RTSP request method (OPTIONS, SETUP, PLAY, etc...) */
    RTSP_REQUEST = LONG + 189,

    /* The RTSP session identifier */
    RTSP_SESSION_ID = OBJECTPOINT + 190,

    /* The RTSP stream URI */
    RTSP_STREAM_URI = OBJECTPOINT + 191,

    /* The Transport: header to use in RTSP requests */
    RTSP_TRANSPORT = OBJECTPOINT + 192,

    /* Manually initialize the client RTSP CSeq for this handle */
    RTSP_CLIENT_CSEQ = LONG + 193,

    /* Manually initialize the server RTSP CSeq for this handle */
    RTSP_SERVER_CSEQ = LONG + 194,

    /* The stream to pass to INTERLEAVEFUNCTION. */
    INTERLEAVEDATA = OBJECTPOINT + 195,

    /* Let the application define a custom write method for RTP data */
    INTERLEAVEFUNCTION = FUNCTIONPOINT + 196,

    /* Turn on wildcard matching */
    WILDCARDMATCH = LONG + 197,

    /* Directory matching callback called before downloading of an
     individual file (chunk) started */
    CHUNK_BGN_FUNCTION = FUNCTIONPOINT + 198,

    /* Directory matching callback called after the file (chunk)
     was downloaded, or skipped */
    CHUNK_END_FUNCTION = FUNCTIONPOINT + 199,

    /* Change match (fnmatch-like) callback for wildcard matching */
    FNMATCH_FUNCTION = FUNCTIONPOINT + 200,

    /* Let the application define custom chunk data pointer */
    CHUNK_DATA = OBJECTPOINT + 201,

    /* FNMATCH_FUNCTION user pointer */
    FNMATCH_DATA = OBJECTPOINT + 202,

    /* send linked-list of name:port:address sets */
    RESOLVE = OBJECTPOINT + 203,

    /* Set a username for authenticated TLS */
    TLSAUTH_USERNAME = OBJECTPOINT + 204,

    /* Set a password for authenticated TLS */
    TLSAUTH_PASSWORD = OBJECTPOINT + 205,

    /* Set authentication type for authenticated TLS */
    TLSAUTH_TYPE = OBJECTPOINT + 206,

    /* Set to 1 to enable the "TE:" header in HTTP requests to ask for
     compressed transfer-encoded responses. Set to 0 to disable the use of TE:
     in outgoing requests. The current default is 0, but it might change in a
     future libcurl release.

     libcurl will ask for the compressed methods it knows of, and if that
     isn't any, it will not ask for transfer-encoding at all even if this
     option is set to 1.

    */
    TRANSFER_ENCODING = LONG + 207,

    /* Callback function for closing socket (instead of close(2)). The callback
     should have type curl_closesocket_callback */
    CLOSESOCKETFUNCTION = FUNCTIONPOINT + 208,
    CLOSESOCKETDATA     = OBJECTPOINT + 209,

    /* allow GSSAPI credential delegation */
    GSSAPI_DELEGATION   = LONG + 210,

    /* Set the name servers to use for DNS resolution */
    DNS_SERVERS         = OBJECTPOINT + 211,

    /* Time-out accept operations (currently for FTP only) after this amount
     of milliseconds. */
    ACCEPTTIMEOUT_MS    = LONG + 212,

    /* Set TCP keepalive */
    TCP_KEEPALIVE       = LONG + 213,

    /* non-universal keepalive knobs (Linux, AIX, HP-UX, more) */
    TCP_KEEPIDLE        = LONG + 214,
    TCP_KEEPINTVL       = LONG + 215,

    /* Enable/disable specific SSL features with a bitmask, see CURLSSLOPT_* */
    SSL_OPTIONS = LONG + 216,

    /* Set the SMTP auth originator */
    MAIL_AUTH = OBJECTPOINT + 217,

    /* Enable/disable SASL initial response */
    SASL_IR = LONG + 218,

    /* Function that will be called instead of the internal progress display
    * function. This function should be defined as the curl_xferinfo_callback
    * prototype defines. (Deprecates PROGRESSFUNCTION) */
    XFERINFOFUNCTION = FUNCTIONPOINT + 219,

    /* The XOAUTH2 bearer token */
    XOAUTH2_BEARER = OBJECTPOINT + 220,

    /* Set the interface string to use as outgoing network
    * interface for DNS requests.
    * Only supported by the c-ares DNS backend */
    DNS_INTERFACE = OBJECTPOINT + 221,

    /* Set the local IPv4 address to use for outgoing DNS requests.
    * Only supported by the c-ares DNS backend */
    DNS_LOCAL_IP4 = OBJECTPOINT + 222,

    /* Set the local IPv6 address to use for outgoing DNS requests.
    * Only supported by the c-ares DNS backend */
    DNS_LOCAL_IP6 = OBJECTPOINT + 223,

    /* Set authentication options directly */
    LOGIN_OPTIONS = OBJECTPOINT + 224,

    /* Enable/disable TLS NPN extension (http2 over ssl might fail without) */
    SSL_ENABLE_NPN = LONG + 225,

    /* Enable/disable TLS ALPN extension (http2 over ssl might fail without) */
    SSL_ENABLE_ALPN = LONG + 226,

    /* Time to wait for a response to a HTTP request containing an
    * Expect: 100-continue header before sending the data anyway. */
    EXPECT_100_TIMEOUT_MS = LONG + 227,

    /* This points to a linked list of headers used for proxy requests only,
     struct curl_slist kind */
    PROXYHEADER = OBJECTPOINT + 228,

    /* Pass in a bitmask of "header options" */
    HEADEROPT = LONG + 229,

    /* The public key in DER form used to validate the peer public key
     this option is used only if SSL_VERIFYPEER is true */
    PINNEDPUBLICKEY = OBJECTPOINT + 230,

    /* Path to Unix domain socket */
    UNIX_SOCKET_PATH = OBJECTPOINT + 231,

    /* Set if we should verify the certificate status. */
    SSL_VERIFYSTATUS = LONG + 232,

    /* Set if we should enable TLS false start. */
    SSL_FALSESTART = LONG + 233,

    /* Do not squash dot-dot sequences */
    PATH_AS_IS = LONG + 234,

    /* Proxy Service Name */
    PROXY_SERVICE_NAME = OBJECTPOINT + 235,

    /* Service Name */
    SERVICE_NAME = OBJECTPOINT + 236,

    /* Wait/don't wait for pipe/mutex to clarify */
    PIPEWAIT = LONG + 237,

    /* Set the protocol used when curl is given a URL without a protocol */
    DEFAULT_PROTOCOL = OBJECTPOINT + 238,

    /* Set stream weight, 1 - 256 (default is 16) */
    STREAM_WEIGHT = LONG + 239,

    /* Set stream dependency on another CURL handle */
    STREAM_DEPENDS = OBJECTPOINT + 240,

    /* Set E-xclusive stream dependency on another CURL handle */
    STREAM_DEPENDS_E = OBJECTPOINT + 241,

    /* Do not send any tftp option requests to the server */
    TFTP_NO_OPTIONS = LONG + 242,

    /* Linked-list of host:port:connect-to-host:connect-to-port,
     overrides the URL's host:port (only for the network layer) */
    CONNECT_TO = OBJECTPOINT + 243,

    /* Set TCP Fast Open */
    TCP_FASTOPEN = LONG + 244,

    /* Continue to send data if the server responds early with an
    * HTTP status code >= 300 */
    KEEP_SENDING_ON_ERROR = LONG + 245,

    /* The CApath or CAfile used to validate the proxy certificate
     this option is used only if PROXY_SSL_VERIFYPEER is true */
    PROXY_CAINFO = OBJECTPOINT + 246,

    /* The CApath directory used to validate the proxy certificate
     this option is used only if PROXY_SSL_VERIFYPEER is true */
    PROXY_CAPATH = OBJECTPOINT + 247,

    /* Set if we should verify the proxy in ssl handshake,
     set 1 to verify. */
    PROXY_SSL_VERIFYPEER = LONG + 248,

    /* Set if we should verify the Common name from the proxy certificate in ssl
    * handshake, set 1 to check existence, 2 to ensure that it matches
    * the provided hostname. */
    PROXY_SSL_VERIFYHOST = LONG + 249,

    /* What version to specifically try to use for proxy.
     See CURL_SSLVERSION defines below. */
    PROXY_SSLVERSION = LONG + 250,

    /* Set a username for authenticated TLS for proxy */
    PROXY_TLSAUTH_USERNAME = OBJECTPOINT + 251,

    /* Set a password for authenticated TLS for proxy */
    PROXY_TLSAUTH_PASSWORD = OBJECTPOINT + 252,

    /* Set authentication type for authenticated TLS for proxy */
    PROXY_TLSAUTH_TYPE = OBJECTPOINT + 253,

    /* name of the file keeping your private SSL-certificate for proxy */
    PROXY_SSLCERT = OBJECTPOINT + 254,

    /* type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") for
     proxy */
    PROXY_SSLCERTTYPE = OBJECTPOINT + 255,

    /* name of the file keeping your private SSL-key for proxy */
    PROXY_SSLKEY = OBJECTPOINT + 256,

    /* type of the file keeping your private SSL-key ("DER", "PEM", "ENG") for
     proxy */
    PROXY_SSLKEYTYPE = OBJECTPOINT + 257,

    /* password for the SSL private key for proxy */
    PROXY_KEYPASSWD = OBJECTPOINT + 258,

    /* Specify which SSL ciphers to use for proxy */
    PROXY_SSL_CIPHER_LIST = OBJECTPOINT + 259,

    /* CRL file for proxy */
    PROXY_CRLFILE = OBJECTPOINT + 260,

    /* Enable/disable specific SSL features with a bitmask for proxy, see
     CURLSSLOPT_* */
    PROXY_SSL_OPTIONS = LONG + 261,

    /* Name of pre proxy to use. */
    PRE_PROXY = OBJECTPOINT + 262,

    /* The public key in DER form used to validate the proxy public key
     this option is used only if PROXY_SSL_VERIFYPEER is true */
    PROXY_PINNEDPUBLICKEY = OBJECTPOINT + 263,

    /* Path to an abstract Unix domain socket */
    ABSTRACT_UNIX_SOCKET = OBJECTPOINT + 264,

    /* Suppress proxy CONNECT response headers from user callbacks */
    SUPPRESS_CONNECT_HEADERS = LONG + 265,

    /* The request target, instead of extracted from the URL */
    REQUEST_TARGET = OBJECTPOINT + 266,

    /* bitmask of allowed auth methods for connections to SOCKS5 proxies */
    SOCKS5_AUTH = LONG + 267,

    /* Enable/disable SSH compression */
    SSH_COMPRESSION = LONG + 268,

    /* Post MIME data. */
    MIMEPOST = OBJECTPOINT + 269,

    /* Time to use with the TIMECONDITION. Specified in number of
     seconds since 1 Jan 1970. */
    TIMEVALUE_LARGE = OFF_T + 270,

    /* Head start in milliseconds to give happy eyeballs. */
    HAPPY_EYEBALLS_TIMEOUT_MS = LONG + 271,

    /* Function that will be called before a resolver request is made */
    RESOLVER_START_FUNCTION = FUNCTIONPOINT + 272,

    /* User data to pass to the resolver start callback. */
    RESOLVER_START_DATA = OBJECTPOINT + 273,

    /* send HAProxy PROXY protocol header? */
    HAPROXYPROTOCOL = LONG + 274,

    /* shuffle addresses before use when DNS returns multiple */
    DNS_SHUFFLE_ADDRESSES = LONG + 275,

    /* Specify which TLS 1.3 ciphers suites to use */
    TLS13_CIPHERS = OBJECTPOINT + 276,
    PROXY_TLS13_CIPHERS = OBJECTPOINT + 277,

    /* Disallow specifying username/login in URL. */
    DISALLOW_USERNAME_IN_URL = LONG + 278,

    LASTENTRY, /* the last unused */
}

/* parameter for the CURLOPT_USE_SSL option */
UseSsl :: enum i32 {
    NONE,    /* do not attempt to use SSL */
    TRY,     /* try using SSL, proceed anyway otherwise */
    CONTROL, /* SSL for the control connection or fail */
    ALL,     /* SSL for all communication or fail */
    LAST,    /* not an option, never use */
};

Auth :: enum u64 {
    NONE      = 0,          // No HTTP authentication
    BASIC     = 1 <<  0,    // HTTP Basic authentication (default)
    DIGEST    = 1 <<  1,    // HTTP Digest authentication
    NEGOTIATE = 1 <<  2,    // HTTP Negotiate (SPNEGO) authentication
    GSSAPI    = NEGOTIATE,  // Used for CURLOPT_SOCKS5_AUTH to stay terminologically correct
    NTLM      = 1 <<  3,    // HTTP NTLM authentication
    DIGEST_IE = 1 <<  4,    // HTTP Digest authentication with IE flavour
    NTLM_WB   = 1 <<  5,    // HTTP NTLM authentication delegated to winbind helper
    BEARER    = 1 <<  6,    // HTTP Bearer token authentication
    AWS_SIGV4 = 1 <<  7,
    ONLY      = 1 << 31,    // Use together with a single other type to force no authentication or just that single type
    //ANY       = ~DIGEST_IE, // All fine types set
    //ANYSAFE   = ~(BASIC | DIGEST_IE), // All fine types except Basic
}

HttpVersion :: enum {
    NONE,               // setting this means we don't care, and that we'd like the library to choose the best possible for us!
    _1_0,               // Please use HTTP 1.0 in the request
    _1_1,               // Please use HTTP 1.1 in the request
    _2_0,               // Please use HTTP 2 in the request
    _2TLS,              // Use version 2 for HTTPS, version 1.1 for HTTP
    _2_PRIOR_KNOWLEDGE, // Please use HTTP 2 without HTTP/1.1 Upgrade
    _3 = 30,           // Makes use of explicit HTTP/3 without fallback. Use CURLOPT_ALTSVC to enable HTTP/3 upgrade
    LAST,               // *ILLEGAL* http version
}

SslVersion :: enum {
  DEFAULT,
  TLSv1, /* TLS 1.x */
  SSLv2,
  SSLv3,
  TLSv1_0,
  TLSv1_1,
  TLSv1_2,
  TLSv1_3,

  LAST, /* never use, keep last */
}

SList :: struct {
    data: ^i8,
    next: ^SList,
}

@(link_prefix="curl_")
foreign libcurl {
    easy_init :: proc() -> Curl ---
    easy_setopt :: proc(curl: Curl, option: CurlOption, #c_vararg args: ..any) -> CurlCode ---
    easy_perform :: proc(curl: Curl) -> CurlCode ---
    easy_cleanup :: proc(curl: Curl) ---
    easy_strerror :: proc(code: CurlCode) -> cstring ---
    
    slist_append :: proc(list: ^SList, s: ^u8) -> ^SList ---
    slist_free_all :: proc(list: ^SList) ---

    easy_escape :: proc(curl: Curl, string: ^u8, len: int) -> cstring ---

    free :: proc(ptr: cstring) ---
}
