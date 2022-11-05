import bs4
import requests
import re


class scrap:
    def overview(self) -> dict:
        return {"id": 'overview'}

    def recipes(self) -> dict:
        return {"id": 'recipes'}

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
