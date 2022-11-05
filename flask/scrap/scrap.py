import bs4
import requests

class scrap:
    def overview(self) -> dict:
        return {"id":'overview'}

    def recipes(self) -> dict:
        return {"id":'recipes'}
    
    def articles(self) -> dict:
        return {"id":'articles'}

if __name__ == "__main__":
    print(scrap().articles())