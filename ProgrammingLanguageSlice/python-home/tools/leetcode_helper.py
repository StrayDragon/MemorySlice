import requests
from bs4 import BeautifulSoup

s = requests.session()
headers =  {
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'Accept-Encoding': 'gzip, deflate, sdch',
        'Accept-Language': 'en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4,zh-TW;q=0.2',
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36'
}

url = 'https://leetcode-cn.com/accounts/login/'
# content = gethtml(url)
# soup = BeautifulSoup(content,'html.praser')

# def getUrl

# def getcsrf():
#     input_tag = soup.input
# 		return input_tag['value']

def main():
    res = s.get(url=url,headers=headers)
    print(res.text)
	
if __name__ == '__main__':
    main()
