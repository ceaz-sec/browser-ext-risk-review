from datetime import datetime
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import ElementNotVisibleException
from selenium.common.exceptions import ElementNotInteractableException
import os
import re
import subprocess
import time

# Open Chrome in Incognito mode
chrome_options = Options()

download_dir = "/home/ceaz/Security_Niche/Projects/browser-ext-risk-review/source_code_extraction"

# Set Chrome preferences
chrome_prefs = {
     "download.default_directory": download_dir,
     "download.prompt_for_download": False, # Disable the "Save As" dialog
     "profile.default_content_settings.popups": 0, # Block popup windows
     "download.directory_upgrade": True,
     "safebrowsing.enabled": True
}

chrome_options.add_experimental_option("prefs", chrome_prefs)
chrome_options.add_argument("--headless")

# Browser Control
browser = webdriver.Chrome(options=chrome_options); time.sleep(3)
browser.get("https://crxviewer.com")
# maximize window
# browser.maximize_window(); time.sleep(2)

def get_ext_url() -> str:
    try:
        print("Please Enter a Chrome Extension url:\n")
        ext_url = input()
        browser.switch_to.new_window('tab'); time.sleep(3)
        browser.get(ext_url); time.sleep(4)
        browser.switch_to.window(browser.window_handles[0]) #Switch back to crxviewer site
    except Exception as error:
        print(error)
    return ext_url

def last_updated(ext_url) -> str:
    try:
        browser.switch_to.new_window('tab'); time.sleep(3)
        browser.get(ext_url); time.sleep(7)
        updated_date = browser.find_element(By.XPATH, "//div[text()='Updated']/following-sibling::div").text; time.sleep(4)
        print(f"Last Updated Date: {updated_date}")
        with open("last_update.txt", "a") as f:
            f.write(f"Last Updated: {updated_date}\n")
        browser.switch_to.window(browser.window_handles[0])
    except (ElementNotInteractableException, ElementNotVisibleException, NoSuchElementException) as error:
        print(error)
    return updated_date

def parse_ext_id(ext_url: str) -> str:
    try:
        match = re.search(r"/([a-z]{32})", ext_url)
        if not match:
            raise ValueError("Invalid Chrome extension URL")
        ext_id = match.group(1)
    except Exception as error:
        print(error)
    ext_id = match.group(1)
    return ext_id

def get_crx_source_code(ext_id: str) -> None:
    try:
        url_box = browser.find_element(By.ID, "url-input"); time.sleep(5)
        url_box.click(); time.sleep(4)
        url_box.send_keys(ext_id); time.sleep(5)
        download_button = browser.find_element(By.ID, "download-btn")
        download_button.click(); time.sleep(5)
        download_button = browser.find_element(By.ID, "download-link")
        download_button.click(); time.sleep(7)
    except (ElementNotInteractableException, ElementNotVisibleException, NoSuchElementException) as error:
        print(error)

def unzip_source_code(ext_id) -> None:
    try:
        unzip = ["unzip", f"./source_code_extraction/{ext_id}.zip", "-d", "./source_code_extraction"]
        process = subprocess.check_output(unzip, text=True)
        print(process)
    except Exception as error:
        print(error)
    return None

def call_manifest_parser() -> None:
    try:
        manifest_parser = ["lua", "manifest_risk_assessment.lua"]
        process = subprocess.check_output(manifest_parser, text=True)
        print(process)
    except Exception as error:
        print(error)
    return None

def main():
    ext_url = get_ext_url()

    ext_id = parse_ext_id(ext_url)

    get_crx_source_code(ext_id)

    last_updated(ext_url)

    unzip_source_code(ext_id)

    call_manifest_parser()

if __name__=='__main__':
  main()
