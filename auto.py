import time
import pyautogui
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import Select


chrome_options = Options()
chrome_options.add_argument("--start-maximized")


br = webdriver.Chrome('./chromedriver',chrome_options=chrome_options)  # Optional argument, if not specified will search path.

br.get('https://nucleus.niituniversity.in/');
email = br.find_element_by_id('SchSel_txtUserName') # Find the Username field
            
email.send_keys("U101115FCS046") # Enter the username 

pas = br.find_element_by_id('SchSel_txtPassword') # Find the Username field

pas.send_keys("") # Enter the Password

br.execute_script("document.getElementById('SchSel_btnLogin').click()") # JS to click the submit Button
br.get('https://nucleus.niituniversity.in/WebApp/StudParentDashBoard/DailyDiary.aspx')
dropdown = Select(br.find_element_by_id("Timeinhr"));
dropdown.select_by_visible_text("10"); # 10 AM

dropdown = Select(br.find_element_by_id("Timeouthr"));
dropdown.select_by_visible_text("18"); # 6 PM

dropdown = Select(br.find_element_by_id("Timeoutmin"));
dropdown.select_by_visible_text("30"); # (30 Min) 6:30 PM


email = br.find_element_by_id('txtKeyPerson') 
            
email.send_keys("Bibek Deroy")  # Key Person

email = br.find_element_by_id('txtEmail')
            
email.send_keys("bibek.deroy@vintellus.com") # Key Person's Email ID

email = br.find_element_by_id('txtDesc')
            
email.send_keys("Working with the JUnit Test cases and Fixing Bugs") # !!!!!!!!!!!!!!-------JUST UPDATE THIS DAILY ----------!!!!!!!!!!!!!!!!!!!!!!!!!1



br.find_element_by_id('ctl00_ContentPlaceHolder1_btnSubmit').click()


