from bs4 import BeautifulSoup
from pymongo import MongoClient
import re
import csv
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time
from selenium.webdriver.common.action_chains import ActionChains
from selenium.webdriver.support import expected_conditions as ec
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.common.by import By
import os
import datetime
import json
import requests



def open_browser_with_investing():
    options = Options()
    options.add_extension('AdGuard.crx')
    options.headless = False
    browser = webdriver.Chrome(options=options)
    time.sleep(10)
    browser.get("https://ru.investing.com/")
    cookies = [{'domain': 'ru.investing.com', 'expiry': 1612269929, 'httpOnly': False, 'name': 'nyxDorf', 'path': '/', 'secure': False, 'value': 'YGQzZzNnNXdhNGhkMn8yNDVjYyZkZWBgPCFicWFkMzg4PT93ZGdhemE%2BYT1ncDU4MTM%3D'}, {'domain': '.investing.com', 'expiry': 1643802329, 'httpOnly': True, 'name': 'ses_id', 'path': '/', 'secure': False, 'value': 'OXdhIGRrYWk0cGlvZzZjYWU2NG0%2FMGFjNTA1NzY1MyVidjY4NGM%2FeWJtPnAzMDEtMTg0N2YwOjwwMW5gNjdjMDk6YWNkMWFsNDFpYWdgY2llMjQ8PzphZjUwNT42MzM%2BYmM2aDQxPzliYT4wM2wxOzEjNChmIjorMGJuPjZ3YyQ5NmEgZDRhPTRjaWxnN2MzZTE0Zz9pYWo1NzU3NmIzK2Ip'}, {'domain': '.investing.com', 'expiry': 1645962300, 'httpOnly': False, 'name': '__gads', 'path': '/', 'secure': False, 'value': 'ID=ed93c464cc062712:T=1612266300:S=ALNI_MaRPPL3Lh7Md6vQlgacXUvTPWvvKg'}, {'domain': '.ru.investing.com', 'expiry': 1612352725, 'httpOnly': False, 'name': 'comment_notification_202280414', 'path': '/', 'secure': False, 'value': '1'}, {'domain': 'ru.investing.com', 'httpOnly': False, 'name': 'GED_PLAYLIST_ACTIVITY', 'path': '/', 'secure': True, 'value': 'W3sidSI6IjVVL0IiLCJ0c2wiOjE2MTIyNjYzMzksIm52IjoxLCJ1cHQiOjE2MTIyNjYzMjksImx0IjoxNjEyMjY2MzM2fV0.'}, {'domain': '.ru.investing.com', 'expiry': 1614858325, 'httpOnly': True, 'name': 'r_p_s_n', 'path': '/', 'secure': False, 'value': '1'}, {'domain': '.ru.investing.com', 'expiry': 1612352725, 'httpOnly': False, 'name': 'adsFreeSalePopUp16b44a510edf99426b4b49317554f837', 'path': '/', 'secure': False, 'value': '1'}, {'domain': '.investing.com', 'expiry': 1612268127, 'httpOnly': False, 'name': '_ym_visorc', 'path': '/', 'sameSite': 'None', 'secure': True, 'value': 'w'}, {'domain': '.investing.com', 'expiry': 1643802301, 'httpOnly': False, 'name': '_ym_uid', 'path': '/', 'sameSite': 'None', 'secure': True, 'value': '1612266301526459532'}, {'domain': 'ru.investing.com', 'httpOnly': False, 'name': 'StickySession', 'path': '/', 'secure': False, 'value': 'id.21564576175.969ru.investing.com'}, {'domain': '.ru.investing.com', 'expiry': 253402257600, 'httpOnly': False, 'name': 'G_ENABLED_IDPS', 'path': '/', 'secure': False, 'value': 'google'}, {'domain': '.investing.com', 'expiry': 1612266359, 'httpOnly': False, 'name': '_gat', 'path': '/', 'secure': False, 'value': '1'}, {'domain': '.investing.com', 'expiry': 1612352726, 'httpOnly': False, 'name': '_gid', 'path': '/', 'secure': False, 'value': 'GA1.2.183560121.1612266300'}, {'domain': '.ru.investing.com', 'expiry': 1612352695, 'httpOnly': False, 'name': 'adsFreeSalePopUp', 'path': '/', 'secure': False, 'value': '1'}, {'domain': '.investing.com', 'expiry': 1675338326, 'httpOnly': False, 'name': '_ga', 'path': '/', 'secure': False, 'value': 'GA1.2.136928086.1612266300'}, {'domain': '.investing.com', 'expiry': 1612268095, 'httpOnly': False, 'name': 'smd', 'path': '/', 'secure': False, 'value': '0aa92a1e1a5eeda0b53540810480828e-1612266293.016'}, {'domain': '.investing.com', 'expiry': 1612338301, 'httpOnly': False, 'name': '_ym_isad', 'path': '/', 'sameSite': 'None', 'secure': True, 'value': '2'}, {'domain': 'ru.investing.com', 'expiry': 1612352695, 'httpOnly': False, 'name': 'gtmFired', 'path': '/', 'secure': False, 'value': 'OK'}, {'domain': '.investing.com', 'expiry': 1643802329, 'httpOnly': False, 'name': 'udid', 'path': '/', 'secure': False, 'value': '0aa92a1e1a5eeda0b53540810480828e'}, {'domain': '.investing.com', 'expiry': 1620042327, 'httpOnly': False, 'name': '_fbp', 'path': '/', 'sameSite': 'Lax', 'secure': False, 'value': 'fb.1.1612266301632.929977051'}, {'domain': '.investing.com', 'expiry': 1893456000, 'httpOnly': False, 'name': 'adBlockerNewUserDomains', 'path': '/', 'secure': False, 'value': '1612266295'}, {'domain': '.investing.com', 'expiry': 1643802301, 'httpOnly': False, 'name': '_ym_d', 'path': '/', 'sameSite': 'None', 'secure': True, 'value': '1612266301'}, {'domain': 'ru.investing.com', 'expiry': 1612295095, 'httpOnly': False, 'name': 'geoC', 'path': '/', 'secure': False, 'value': 'RU'}, {'domain': '.ru.investing.com', 'expiry': 1614858329, 'httpOnly': False, 'name': 'SideBlockUser', 'path': '/', 'secure': False, 'value': 'a%3A2%3A%7Bs%3A10%3A%22stack_size%22%3Ba%3A1%3A%7Bs%3A11%3A%22last_quotes%22%3Bi%3A8%3B%7Ds%3A6%3A%22stacks%22%3Ba%3A1%3A%7Bs%3A11%3A%22last_quotes%22%3Ba%3A1%3A%7Bi%3A0%3Ba%3A3%3A%7Bs%3A7%3A%22pair_ID%22%3Bs%3A5%3A%2213725%22%3Bs%3A10%3A%22pair_title%22%3Bs%3A0%3A%22%22%3Bs%3A9%3A%22pair_link%22%3Bs%3A17%3A%22%2Fequities%2Fvtb_rts%22%3B%7D%7D%7D%7D'}, {'domain': 'ru.investing.com', 'expiry': 1612266601, 'httpOnly': False, 'name': 'outbrain_cid_fetch', 'path': '/', 'secure': False, 'value': 'true'}, {'domain': 'ru.investing.com', 'httpOnly': False, 'name': 'PHPSESSID', 'path': '/', 'secure': False, 'value': 'eghablq02a5hebqa5tbouatl70'}, {'domain': '.investing.com', 'expiry': 1612266359, 'httpOnly': False, 'name': '_gat_allSitesTracker', 'path': '/', 'secure': False, 'value': '1'}, {'domain': 'ru.investing.com', 'expiry': 1612268125, 'httpOnly': False, 'name': 'UserReactions', 'path': '/', 'secure': False, 'value': 'true'}, {'domain': 'ru.investing.com', 'httpOnly': False, 'name': 'logglytrackingsession', 'path': '/equities', 'secure': False, 'value': '34b600b1-403f-4ba9-adbf-fbf372600c2a'}]
    for cookie in cookies:
        browser.add_cookie(cookie)
    browser.refresh()
    browser.maximize_window()
    return browser


def get_tools_list(browser, link, name, tag):
    browser.get("https://ru.investing.com/" + link)
    time.sleep(10)
    soup = BeautifulSoup(browser.page_source)
    table = soup.find_all(tag)
    links_raw = soup.find_all("td", "plusIconTd")
    links = []
    for link in links_raw:
        links.append(link.contents[0].attrs['href'].replace(".", ""))
    prices = []
    for i in range(0, len(table)):
        if "class" in table[i].attrs and len(table[i].attrs["class"]) > 0:
            if table[i].attrs["class"][0].find(name) != -1:
                prices.append(table[i].text)

    return prices, links


def get_tool_info(browser, tool_link):
    tool_link = tool_link.replace("?cid=956470", "").replace("?cid=959207", "").replace("?cid=959208", "").replace("?cid=959211", "").replace("?cid=38153", "").replace("?cid=1061755", "").replace("?cid=40737", "").replace("?cid=40738", "").replace("?cid=40750", "").replace("?cid=40740", "").replace("?cid=40741", "")
    browser.get("https://ru.investing.com" + tool_link)
    WebDriverWait(browser, 10).until(ec.presence_of_element_located((By.TAG_NAME, "html")))
    browser.find_element_by_tag_name('html')

    time.sleep(10)

    title = tool_link.split("/")[-1]
    image_name = title.replace("/","").split(" ")[0] + " - " + str(datetime.date.today()) + ".png"
    tech_name = title.replace("/","").split(" ")[0] + " - " + str(datetime.date.today()) + "tech" + ".png"
    ma_name = title.replace("/","").split(" ")[0] + " - " + str(datetime.date.today()) + "ma" + ".png"

    picture1 = browser.find_element_by_class_name("instrumentHeader")
    actions2 = ActionChains(browser)
    actions2.move_to_element(picture1).perform()

    candles = browser.find_element_by_class_name("candlesIcon")
    candles.click()
    time.sleep(5)
    browser.find_element_by_xpath('//*[@title="1 день"]').click()
    time.sleep(5)
    picture = browser.find_element_by_id("js_instrument_chart_last_update")
    actions = ActionChains(browser)
    actions.move_to_element(picture).perform()
    image = browser.find_element_by_id("js_instrument_chart").screenshot(image_name)

    browser.get("https://ru.investing.com" + tool_link + "-technical")
    time.sleep(10)
    popup = browser.find_elements_by_class_name("allow-notifications-popup-close-button")
    if len(popup) != 0:
        popup[0].click()

    browser.find_elements_by_xpath("//*[contains(text(), '1 день')]")[0].click()
    time.sleep(1)
    browser.find_elements_by_xpath("//*[contains(text(), '1 день')]")[0].click()
    time.sleep(5)
    soup = BeautifulSoup(browser.page_source)
    short_anal_raw = soup.find("div", "newTechStudiesRight")
    short_anal = {short_anal_raw.contents[1].contents[0]:
                      short_anal_raw.contents[1].contents[1].text,
                  short_anal_raw.contents[3].contents[0].text.replace(".", ""):
                      short_anal_raw.contents[3].contents[1].text +
                      short_anal_raw.contents[3].contents[2].text.replace("Покупать", "") + " / " +
                      short_anal_raw.contents[3].contents[3].text.replace("Продавать ", ""),
                  short_anal_raw.contents[5].contents[0].text.replace(".", ""):
                      short_anal_raw.contents[5].contents[1].text +
                      short_anal_raw.contents[5].contents[2].text.replace("Покупать", "") + " / " +
                      short_anal_raw.contents[5].contents[3].text.replace("Продавать ", "")
                  }

    browser.find_element_by_class_name("technicalIndicatorsTbl").screenshot(tech_name)
    browser.find_element_by_class_name("movingAvgsTbl").screenshot(ma_name)

    image_path = os.path.abspath(image_name)
    tech_path = os.path.abspath(tech_name)
    ma_path = os.path.abspath(ma_name)

    return title,short_anal, image_path, tech_path, ma_path


def get_invest_ideas(browser):
    ideas_to_db = []
    for i in range(1, 2):
        browser.get("https://invest-idei.ru/ideas?asset=all&active_id=&iis=0&currency=&growth_factors=&status=any&hot=0&potential_yield=0,101&horizon=0,27&risk=0&broker_id=45,5,56,47,35,28,53&min_rating=&stat=0&licenced=0&sort_by=date_start&sort_order=desc&period=all&date_from=&date_to=&page=" + str(i))
        cookies = [{'domain': '.invest-idei.ru', 'expiry': 3759917636, 'httpOnly': True, 'name': 'ii', 'path': '/', 'secure': False, 'value': 'nmPi7p7xrRDejJlJUnZqR4OngepkFQwdRirKz4sF'}, {'domain': '.invest-idei.ru', 'expiry': 1612505976, 'httpOnly': False, 'name': '_ym_isad', 'path': '/', 'sameSite': 'None', 'secure': True, 'value': '2'}, {'domain': '.invest-idei.ru', 'expiry': 1612434036, 'httpOnly': False, 'name': '_gat_UA-109450187-1', 'path': '/', 'secure': False, 'value': '1'}, {'domain': '.invest-idei.ru', 'expiry': 1643969976, 'httpOnly': False, 'name': '_ym_uid', 'path': '/', 'sameSite': 'None', 'secure': True, 'value': '1612433976118307271'}, {'domain': '.invest-idei.ru', 'expiry': 1612520396, 'httpOnly': False, 'name': '_gid', 'path': '/', 'secure': False, 'value': 'GA1.2.2011091654.1612433976'}, {'domain': '.invest-idei.ru', 'expiry': 1643969976, 'httpOnly': False, 'name': '_ym_d', 'path': '/', 'sameSite': 'None', 'secure': True, 'value': '1612433976'}, {'domain': '.invest-idei.ru', 'expiry': 1675505996, 'httpOnly': False, 'name': '_ga', 'path': '/', 'secure': False, 'value': 'GA1.2.2006825923.1612433976'}]
        for cookie in cookies:
            browser.add_cookie(cookie)
        browser.refresh()
        time.sleep(10)

        soup = BeautifulSoup(browser.page_source)
        ideas = soup.find_all("div", "app-table-row")
        # periods_raw = browser.find_elements_by_class_name('_profit-label')
        # periods = []
        # for period in periods_raw:
        #     if len(period.text) != 0 and period.text.find("лосс") == -1 and period.text.find("Открытие") == -1:
        #         periods.append(period.text)
        # ideas_to_db = []
        # перебираем идеи
        for idea_num in range(2, len(ideas)):
            title = ideas[idea_num].find("a", "_title-link")
            subtitle = ideas[idea_num].find("div", "_subtitle")
            source = ideas[idea_num].find("div", "_rating-label")
            date = ideas[idea_num].find("div", "_date-value")
            current_profit = ideas[idea_num].find_all("div", "_profit-value")
            if len(current_profit) == 2:
                profit = current_profit[0].text
                goal = current_profit[1].text
            if len(current_profit) == 1:
                profit = current_profit[0].text
                goal = "Не определено"
            if len(current_profit) == 0:
                profit = "Закрыто"
                goal = "Целевая цена достигнута"

            period = ideas[idea_num].find_all("div", '_profit-label')[1].text.replace("\n        ", "")

            urls = ideas[idea_num].find_all("a")
            url = ""
            for u in urls:
                if u.text == "ОРИГИНАЛ и ПОЛНАЯ ВЕРСИЯ ИДЕИ":
                    url = u.attrs['href']


            dict_to_db = {
                "title": title.text,
                "description": subtitle.text,
                "source": source.text,
                "date": date.text,
                "current_profit": profit,
                "goal": goal,
                "original": url,
                "period": period
            }
            ideas_to_db.append(dict_to_db)
    return ideas_to_db


def open_db():
    client = MongoClient('localhost', 27017)
    db = client['local']
    series_collection = db['series']
    return series_collection


def insert_list(currencies_links, currencies_prices, collection):
    client = MongoClient('localhost', 27017)
    data = dict(zip(currencies_links, currencies_prices))
    name = currencies_links[0].split("/")[1]
    client['local'][name].insert_one(data)
    ids = client['local'][name].find({}).distinct('_id')
    if len(ids) > 1:
        client['local'][name].delete_one({"_id": ids[1]})
    print()


def insert_tool(title, short_anal, image_path, tech_path, ma_path):
    client = MongoClient('localhost', 27017)
    data = {"name": title, "short_anal": short_anal, "plot": image_path, "tech_path": tech_path, "ma_path": ma_path}
    name = title.replace("/", "!").split(" ")[0].replace("-", "!").upper()
    client['local'][name].insert_one(data)
    ids = client['local'][name].find({}).distinct('_id')
    if len(ids) > 1:
        client['local'][name].delete_one({"_id": ids[0]})


def insert_ideas(ideas, collection):
    client = MongoClient('localhost', 27017)
    for idea in ideas:
        client['local'][collection].insert_one(idea)
        print()


def create_list_page(file_name, page_name):
    f0 = "http://127.0.0.1:5000/todo/api/v1.0/" + file_name
    tools = json.loads(requests.get("http://127.0.0.1:5000/todo/api/v1.0/" + file_name).text)
    page = []
    page.append("""
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    	<head>
    	<link rel="stylesheet" href="cgi-bin/css/stylesheet.css">    		
    		<meta http-equiv="Content-Type" content="text/html; charset=cp1251" />
    		<title>""" + page_name + """</title>
    	</head>
    	<body>
    		<div id="top_bar_black">
    			<div id="logo_container">
    				<center><div id="nav_block">
    					<a href="ideas.html"><div class="nav_button">Инвест идеи</div></a>
    					<a href="currencies.html"><div class="nav_button">Форекс</div></a>
    					<a href="commodities.html"><div class="nav_button">Товары</div></a>
    					<a href="indices.html"><div class="nav_button">Индексы</div></a>
    					<a href="etfs.html"><div class="nav_button">ETF</div></a>
    				</center></div>
    			</div>
    		</div>
    		<div id="content_container">
    		<br><br><br>""")

    for key, value in tools[0].items():
        if key.find("_id") == -1:
            page.append("<center><a href='" + key.split("/")[-1] + ".html'>" + "{0}</a>: {1}".format(key
                                                 .replace("/currencies/", "")
                                                 .replace("/commodities/", "")
                                                 .replace("/etfs/", "")
                                                 .replace("?cid=959207", "")
                                                 .replace("?cid=38153", "")
                                                 .replace("?cid=956470", "")
                                                 .replace("/rates-bonds/", "")
                                                 .replace("?cid=959208", "")
                                                 .replace("?cid=959211", "")
                                                 .replace("?cid=1061755", "")
                                                 .replace("?cid=40737", "")
                                                 .replace("?cid=40738", "")
                                                 .replace("?cid=40750", "")
                                                 .replace("?cid=40740", "")
                                                 .replace("?cid=40741", "")
                                                 .replace("/indices/", "")
                                                 .replace("/crypto/bitcoin/", "")
                                                 .replace("/crypto/ethereum/", "")
                                                 .replace("-", "/")
                                                 .upper()
                                                 , value) + "</center>")

    page.append("<center><br><br><br>© Invest tech 2021</center>")
    page.append("""
    		</div>
    	</body>
    </html>
    """)
    with open(file_name + ".html", "w", encoding="cp1251") as file:
        file.write("".join(page))
        file.close()
        print()


def create_tool_page(file_name):
    f0 = "http://127.0.0.1:5000/todo/api/v1.0/tasks/" + file_name.replace("-", "!").upper()
    tool = json.loads(requests.get("http://127.0.0.1:5000/todo/api/v1.0/tasks/" + file_name.replace("-", "!").upper()).text)
    page = []
    page.append("""
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    	<head>
    	<link rel="stylesheet" href="cgi-bin/css/stylesheet.css">    		
    		<meta http-equiv="Content-Type" content="text/html; charset=cp1251" />
    		<title>""" + file_name.replace("-", "/").upper() + """</title>
    	</head>
    	<body>
    		<div id="top_bar_black">
    			<div id="logo_container">
    				<center><div id="nav_block">
    					<a href="ideas.html"><div class="nav_button">Инвест идеи</div></a>
    					<a href="currencies.html"><div class="nav_button">Форекс</div></a>
    					<a href="commodities.html"><div class="nav_button">Товары</div></a>
    					<a href="indices.html"><div class="nav_button">Индексы</div></a>
    					<a href="etfs.html"><div class="nav_button">ETF</div></a>
    				</center></div>
    			</div>
    		</div>
    		<div id="content_container">
    		<br><br><br>""")
    f0 = "<img src='" + tool[0]["plot"] + "'>"
    page.append("<center><img src='" + tool[0]["plot"] + "'></center><br><br>")
    page.append("<div align='center'><img src='" + tool[0]["tech_path"] + "'>   <img src='" + tool[0]["ma_path"] + "'></div>")
    for key, value in tool[0]["short_anal"].items():
        page.append("<center>{0} {1}".format(key, value) + "</center><br>")

    page.append("<center><br><br><br>© Invest tech 2021</center>")
    page.append("""
    		</div>
    	</body>
    </html>
    """)
    file_name = file_name.replace("?cid=956470", "").replace("?cid=959207", "").replace("?cid=959208", "").replace("?cid=959211", "").replace("?cid=38153", "").replace("?cid=1061755", "").replace("?cid=40737", "").replace("?cid=40738", "").replace("?cid=40750", "").replace("?cid=40740", "").replace("?cid=40741", "")
    with open(file_name + ".html", "w", encoding="cp1251") as file:
        file.write("".join(page))
        file.close()
        print()


def create_ideas_page():
    ideas = json.loads(requests.get("http://127.0.0.1:5000/todo/api/v1.0/ideas").text)
    page = []
    page.append("""
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    	<head>
    	<link rel="stylesheet" href="cgi-bin/css/stylesheet.css">    		
    		<meta http-equiv="Content-Type" content="text/html; charset=cp1251" />
    		<title>Инвестиционные идеи</title>
    	</head>
    	<body>
    		<div id="top_bar_black">
    			<div id="logo_container">
    				<center><div id="nav_block">
    					<a href="ideas.html"><div class="nav_button">Инвест идеи</div></a>
    					<a href="currencies.html"><div class="nav_button">Форекс</div></a>
    					<a href="commodities.html"><div class="nav_button">Товары</div></a>
    					<a href="indices.html"><div class="nav_button">Индексы</div></a>
    					<a href="etfs.html"><div class="nav_button">ETF</div></a>
    				</center></div>
    			</div>
    		</div>
    		<div id="content_container">
    		<br><br><br>""")
    for idea in range(0, 10):
        page.append(ideas[idea]["title"] + "<br>")
        page.append((ideas[idea]['description'] + "<br>"))
        page.append((ideas[idea]['source'] + ", " + ideas[idea]['date'] + "<br>"))
        page.append((str(ideas[idea]['current_profit'] )+ "<br>"))
        page.append((ideas[idea]['goal'] + " " + ideas[idea]['period'].replace("₽", "в рублях") + "<br>"))
        page.append(("<a href="+ ideas[idea]['original'] + ">Полная и оригинальная версия</a><br><br>"))

    page.append("<center><br><br><br>© Invest tech 2021</center>")
    page.append("""
    		</div>
    	</body>
    </html>
    """)

    with open("ideas.html", "w", encoding="cp1251") as file:
        file.write("".join(page))
        file.close()
        print()