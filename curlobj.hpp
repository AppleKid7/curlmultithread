#ifndef CURLOBJ_HPP
#define CURLOBJ_HPP

class CurlObj {
public:
    CurlObj();
    ~CurlObj();
    static void *pull_one_url( std::string url );
};

#endif//CURLOBJ_HPP
