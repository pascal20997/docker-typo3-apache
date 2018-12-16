FROM httpd:2.4

ENV SERVER_ADMIN pleaseSetTheEnvironment@variable.tld
ENV DOCUMENT_ROOT /usr/local/apache2/htdocs

# activate modules for FastCGI usage
RUN sed -i -e "s?#LoadModule proxy_module modules/mod_proxy.so?LoadModule proxy_module modules/mod_proxy.so?g" /usr/local/apache2/conf/httpd.conf
RUN sed -i -e "s?#LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so?LoadModule proxy_fcgi_module modules/mod_proxy_fcgi.so?g" /usr/local/apache2/conf/httpd.conf
RUN sed -i -e "s?#Include conf/extra/httpd-vhosts.conf?Include conf/extra/httpd-vhosts.conf?g" /usr/local/apache2/conf/httpd.conf
RUN sed -i -e "s?#LoadModule remoteip_module modules/mod_remoteip.so?LoadModule remoteip_module modules/mod_remoteip.so?g" /usr/local/apache2/conf/httpd.conf
RUN sed -i -e "s?#LoadModule deflate_module modules/mod_deflate.so?LoadModule deflate_module modules/mod_deflate.so?g" /usr/local/apache2/conf/httpd.conf
RUN sed -i -e "s?#LoadModule rewrite_module modules/mod_rewrite.so?LoadModule rewrite_module modules/mod_rewrite.so?g" /usr/local/apache2/conf/httpd.conf

RUN echo '\nInclude conf/extra/remote-ip.conf\n' >> /usr/local/apache2/conf/httpd.conf

# copy apache-conf
COPY apache-conf /usr/local/apache2/conf/extra
