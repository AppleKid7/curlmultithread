#include <iostream>
#include <curl/curl.h>
#include <boost/thread.hpp>
#include <vector>

#define NUMT 4

const std::string urls[NUMT] = {
    "http://curl.haxx.se/",
    "ftp://cool.haxx.se/",
    "http://www.contactor.se/",
    "www.haxx.se"
};

static void *pull_one_url( std::string url ){
    CURL *curl;

    curl = curl_easy_init();
    curl_easy_setopt( curl, CURLOPT_URL, url.c_str() );
    curl_easy_perform( curl );
    curl_easy_cleanup( curl );

    return NULL;
}

int main( int argc, char *argv[] ){

    std::vector<boost::thread*> tid;

    for( int i = 0; i < NUMT; i++ ){
        tid.push_back( new boost::thread( pull_one_url, 
        urls[i] ) );
        //tid.at(i)->join();
    }

    for( int i = 0; i < NUMT; i++ ){
        //delete tid.at(i);
        tid.at(i)->join();
        std::cout << "Thread " << i << " terminated." << std::endl;
    }

    for( std::vector<boost::thread*>::iterator it = tid.begin(); 
        it != tid.end(); it++ ){
        delete *it;
    }

    return 0;
}