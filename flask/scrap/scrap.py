import bs4
import requests

class scrap:
    def __init__(self) -> None:
        pass
    def recipes(self) -> dict:
        return {"id":'recipes'}
    
    def articles(self) -> dict:
        return {"id":'articles'}

if __name__ == "__main__":
    scrap()