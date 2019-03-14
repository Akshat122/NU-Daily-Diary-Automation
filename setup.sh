#!/bin/bash
myvariable=$USER
directory=$(pwd)
clear

read -p "`echo $'\n> '`Enter Your UserName: "  Username

read -s -p "`echo $'\n> '`Enter Password: " Password

read -p "`echo $'\n '``echo $'\n> '`Enter Time in (Hour)(24hr Format): "  Time_in_hr

read -p "`echo $'\n> '`Enter Time in (Min): "  Time_in_min

read -p "`echo $'\n> '`Enter Time out (Hour)(24hr Format): "  Time_out_hr

read -p "`echo $'\n> '`Enter Time out (Min): "  Time_out_min

read -p "`echo $'\n> '`Enter Key Personnel's Name: "  Key_Person_name

read -p "`echo $'\n> '`Enter Key Personnel's Email address: "  Key_person_email

read -p "`echo $'\n> '`Enter Your Work Description: "  Work_Description





echo "import time
import pyautogui
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support.ui import Select


chrome_options = Options()
chrome_options.add_argument('--start-maximized')
chrome_options.add_argument('--no-sandbox')

br = webdriver.Chrome('$directory/chromedriver',chrome_options=chrome_options)  # Optional argument, if not specified will search path.

br.get('https://nucleus.niituniversity.in/');

time.sleep(1) # Let the user actually see something!

email = br.find_element_by_id('SchSel_txtUserName') # Find the Username field
            
email.send_keys('$Username') # Enter the username 

pas = br.find_element_by_id('SchSel_txtPassword') # Find the Username field

pas.send_keys('$Password') # Enter the Password

# submit = br.find_element_by_id('SchSel_btnLogin') # Find the Submit button

time.sleep(1) # Time to update the onChnage() script on the website 

br.execute_script('document.getElementById(\"SchSel_btnLogin\").click()') # JS to click the submit Button

time.sleep(1) # Let the user actually see something!

br.get('https://nucleus.niituniversity.in/WebApp/StudParentDashBoard/DailyDiary.aspx')

time.sleep(1)

dropdown = Select(br.find_element_by_id('Timeinhr'));

dropdown.select_by_visible_text('$Time_in_hr');

dropdown = Select(br.find_element_by_id('Timeinmin'));

dropdown.select_by_visible_text('$Time_in_min');

dropdown = Select(br.find_element_by_id('Timeouthr'));

dropdown.select_by_visible_text('$Time_out_hr');

dropdown = Select(br.find_element_by_id('Timeoutmin'));

dropdown.select_by_visible_text('$Time_out_min');

email = br.find_element_by_id('txtKeyPerson') 
            
email.send_keys('$Key_Person_name')  

email = br.find_element_by_id('txtEmail')
            
email.send_keys('$Key_person_email')

email = br.find_element_by_id('txtDesc')
            
email.send_keys('$Work_Description') 

br.find_element_by_id('ctl00_ContentPlaceHolder1_btnSubmit').click()

br.switch_to_alert().accept()

time.sleep(1)

br.find_element_by_id('ctl00_Header_imgstud').click()

br.find_element_by_id('ctl00_Header_btnLogout').click()

time.sleep(1)

br.close()

" > auto.py

echo "#!/bin/sh

python $directory/auto.py" > run.sh

chmod u+x run.sh

cd /home/$myvariable/Desktop
echo "[Desktop Entry]
Name=Daily Diary Automation
Exec=$directory/run.sh
Icon=$directory/bot.png
Terminal=false
Type=Application" > "Daily Diary Automation New".desktop
chmod u+x "Daily Diary Automation New".desktop

