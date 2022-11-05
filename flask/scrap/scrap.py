import bs4
import requests
import re
import json


class scrap:
    def overview(self) -> dict:
        overview = json.loads(open('json/api.json').read())
        return overview

    def recipes(self) -> dict:
        headers = {
            'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'
        }
        r = requests.get(
            'https://gymbeam.com/blog/fitness-recipes/', headers=headers)
        soup = bs4.BeautifulSoup(r.text, 'html.parser')
        data = {
            'recipes of the day': []
        }
        for a in soup.find_all("a", class_="btn btn-primary"):
            link = a.get("href")
            data['recipes of the day'].append(link)
        return data

    def articles(self) -> dict:
        headers = {
            'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'
        }
        r = requests.get(
            'https://www.thinkinglifter.com/best-fitness-articles/', headers=headers)

        soup = bs4.BeautifulSoup(r.text, 'html.parser')

        data = {
            'articles': []
        }
        for a in soup.find_all("a"):
            link = a.get("href")
            link = link if not re.match(
                r'https://www.thinkinglifter.com/', link) and not re.match(r"#", link) else None
            if link:
                data['articles'].append(link)
        return data


if __name__ == "__main__":
    print(scrap().articles())
