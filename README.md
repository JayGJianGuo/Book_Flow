# README

##Project Records:

180212-master: Add bootstrap and flash function to project

construction: establish every html and related part for next step.

#### 180223-02_book_image:

> failed to push to heroku
> heroku can not run rake db:migrate
> add book image in local & use qiniu to be the ImageUploader

> heroku上传bug
无法加载数据库
方法： Gemfile： gem 'pg', '~> 0.20'、
「控制gem版本！」
> 七牛云的bug
Error 提示：NoMethod: qiniu_up_host**********
方法： Gemfile： gem "carrierwave-qiniu", "~> 1.1.5"
「控制gem版本」
