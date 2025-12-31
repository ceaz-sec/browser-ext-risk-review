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
import time

# Open Chrome in Incognito mode
chrome_options = Options()

download_dir = "/home/ceaz/Security_Niche/Projects/browser-extension-risk/source_code_extraction"

# Set Chrome preferences
chrome_prefs = {
     "download.default_directory": download_dir,
     "download.prompt_for_download": False, # Disable the "Save As" dialog
     "profile.default_content_settings.popups": 0, # Block popup windows
     "download.directory_upgrade": True,
     "safebrowsing.enabled": True
}

chrome_options.add_experimental_option("prefs", chrome_prefs)
# chrome_options.add_argument("--incognito")
# chrome_options.add_argument("--headless")
# chrome_options.add_argument("--no-sandbox")


# Browser Control
browser = webdriver.Chrome(options=chrome_options); time.sleep(3)
browser.get("https://crxviewer.com")
# maximize window
# browser.maximize_window(); time.sleep(2)

def get_ext_url() -> str:
    try:
        print("Please Enter a Chrome Extension url:\n")
        ext_url = input()
        print(f"Chrome Extension url:\n{ext_url}")
    except Exception as error:
        print(error)
    return ext_url

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

def parse_ext_id_2(ext_url: str) -> str:
    try:
        match = re.search(r"(?<=/)[a-z0-9]+$", ext_url)
        ext_id = match.group()
    except Exception as error:
        print(error)
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


def main():
    ext_url = get_ext_url()

    ext_id = parse_ext_id(ext_url)

    get_crx_source_code(ext_id)

if __name__=='__main__':
  main()
