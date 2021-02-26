from functions import open_browser_with_investing, get_tools_list, get_tool_info, get_invest_ideas, open_db, \
    insert_list, insert_tool, insert_ideas, create_list_page, create_tool_page, create_ideas_page
import schedule
import time


# def job():
browser = open_browser_with_investing()
lists = [
    # [browser, 'currencies/streaming-forex-rates-majors', "bid", "td", "Форекс"],
    [browser, 'commodities/real-time-futures', "last", "td", "Товары"],
    [browser, 'indices/major-indices', "last", "td", "Индексы"],
    [browser, 'etfs/major-etfs', "last", "td", "ETF"]
]
for params in lists:
    currencies_prices, currencies_links = get_tools_list(params[0], params[1], params[2], params[3])
    insert_list(currencies_links, currencies_prices, "tools_lists")
    create_list_page(params[1].split('/')[0], params[4])
    for tool_link in currencies_links:
        if tool_link not in ['/etfs/velocityshares-3x-inv-natural-gas', '/commodities/us-cotton-no2']:
            tool_info = get_tool_info(browser, tool_link)
            insert_tool(tool_info[0], tool_info[1], tool_info[2], tool_info[3], tool_info[4])
            create_tool_page(tool_link.split('/')[-1])


ideas = get_invest_ideas(browser)
insert_ideas(ideas, "ideas")
create_ideas_page()
print()


# schedule.every().day.at("00:01").do(job)
#
# while True:
#     schedule.run_pending()
#     time.sleep(1)