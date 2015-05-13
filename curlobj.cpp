#include <curl/curl.h>
#include <boost/thread.hpp>
#include "curlobj.hpp"

CurlObj::CurlObj(){

}

CurlObj::~CurlObj(){

}

void *CurlObj::pull_one_url( std::string url ){
    CURL *curl;
    curl = curl_easy_init();
    curl_easy_setopt( curl, CURLOPT_URL, url.c_str() );
    curl_easy_perform( curl );
    curl_easy_cleanup( curl );
    return NULL;
}
