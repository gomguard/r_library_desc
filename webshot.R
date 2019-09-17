library(webshot)
webshot::install_phantomjs()


# webshot("https://www.r-project.org/", "r-viewport.png", cliprect = "viewport")
# webshot("https://www.r-project.org/", "r-sidebar.png", selector = ".sidebar")
# webshot("https://www.r-project.org/", "r-selectors.png",
#         selector = c("#getting-started", "#news"))
# webshot("https://www.r-project.org/", "r-sidebar-zoom.png",
#         selector = ".sidebar", zoom = 2)
# webshot("http://rstudio.github.io/leaflet/",
#         file = c("leaflet_features.png", "leaflet_install.png"),
#         selector = list("#features", "#installation"))

# docker 설치 - selenium 설치 in terminal
curl -fsSL https://get.docker.com/ | sudo sh 
docker pull selenium/standalone-chrome


dir.create('./screenshot')

# ./screenshot/date(2019_06_04)/account_desc.png

url <- 'https://www.verizonwireless.com/'
url <- 'https://www.verizonwireless.com/smartphones/'
url <- 'https://www.verizonwireless.com/smartphones/samsung-galaxy-note-10-plus-5g/?sku=sku3600288'

url <- 'https://www.samsung.com/us/'
account <- 'ses'
desc <- 'mp_1'
account<-'test'
desc<-'test'
for (idx in seq_along(url_list)) {
  url <- url_list[[idx, ]]
  print(url)
  file_path <- sprintf('./screenshot/%s/%s_%s.png', Sys.Date(), account, idx)  
  webshot(url, file_path, delay = 1)
}






library(rvest)
install.packages('RSelenium')

library(RSelenium)

library(curl)

remDr <- remoteDriver(remoteServerAddr = 'localhost',
                      port = 8080L, # 포트번호 입력
                      browserName = "chrome")

remDr$open()
