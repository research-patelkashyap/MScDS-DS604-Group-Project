import scrapy
from ..items import ArxivCategoryTaxonomyItem

class QFinCategoriesSpider(scrapy.Spider):
    name = "categories"

    start_urls = ["https://arxiv.org/category_taxonomy"]

    def parse(self, response):
        for blk in response.css("div.columns.divided"):
            h4 = blk.css("h4")
            
            item = ArxivCategoryTaxonomyItem()
            
            item["code"] = (h4.css("::text").get() or "").strip()
            
            item["name"] = (h4.css("span::text").get() or "").strip()
            
            if item["name"].startswith("(") and item["name"].endswith(")"):
                item["name"] = item["name"][1:-1]
            
            item["description"] = (blk.css("p::text").get() or "").strip()
            
            if item["code"] and item["description"]:
                yield item