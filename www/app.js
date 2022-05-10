const http = require('http');
const hostname = '0.0.0.0';
const port = 80;

const server = http.createServer((req, res) => {

  // 过滤掉 favicon.ico
  if(req.url=='/favicon.ico'){
    res.end();
    return;
  }

  console.log(
    req.method,//请求方法
    req.url,//请求url
    process.env,//所有环境变量
    // process.env.npm_package_name,//当前项目名称
    // process.env.OS,//当前系统名称

  );
  
  res.write('<h1>hello nodejs</h1>');
  res.write((new Date).toLocaleString());
  res.end();

});

server.listen(port, hostname, () => {
  console.log(`服务器运行在 http://${hostname}:${port}/`)
});
