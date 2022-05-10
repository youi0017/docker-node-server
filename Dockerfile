FROM alpine

WORKDIR /www

RUN \
  apk update && \
  apk add nodejs && \
  apk add npm

COPY www/package.json ./
COPY www/app.js ./

RUN npm install

COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh


RUN echo "基础构建完成，准备启动服务"


#可挂载目录：虚拟主机配置目录，www目录，日志目录
VOLUME [ "/www"]

# CMD [ "npm run dev" ]


EXPOSE 80


ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]



