package kz.itstep.entity;

import java.math.BigDecimal;

public class Cource extends Entity {
    private String title;
    private String description;
    private BigDecimal price;
    private Integer duration;
    private Language language;
    private String imgUrl;
    private String htmlBlock;


    public Cource(String title, String description, BigDecimal price, Integer duration, Language language, String imgUrl, String htmlBlock) {
        this.title = title;
        this.description = description;
        this.price = price;
        this.duration = duration;
        this.language = language;
        this.imgUrl = imgUrl;
        this.htmlBlock = htmlBlock;
    }

    public Cource(){}

    public String getHtmlBlock() {
        return htmlBlock;
    }

    public void setHtmlBlock(String htmlBlock) {
        this.htmlBlock = htmlBlock;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Language getLanguage() {
        return language;
    }

    public void setLanguage(Language language) {
        this.language = language;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
