package com.blocknitive.asentify.utils;

import com.steadystate.css.parser.CSSOMParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.w3c.css.sac.InputSource;
import org.w3c.dom.css.*;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class CssInliner {
    public static String inlineCss(File css, String html) throws IOException {
        CSSOMParser parser = new CSSOMParser();
        CSSStyleSheet styleSheet = parser.parseStyleSheet(new InputSource(new FileReader(css)), null, null);
        final Document document = Jsoup.parse(html, "UTF-8");

        return inlineCss(styleSheet, document);
    }

    private static String inlineCss(CSSStyleSheet styleSheet, Document document) {
    	
        final CSSRuleList rules = styleSheet.getCssRules();
        final Map<Element, Map<String, String>> elementStyles = new HashMap<>();

        for (int i = 0; i < rules.getLength(); i++) {
            final CSSRule rule = rules.item(i);
            if (rule instanceof CSSStyleRule) {
                final CSSStyleRule styleRule = (CSSStyleRule) rule;
                final String selector = styleRule.getSelectorText();

                if (!selector.contains(":")) {
                    final Elements selectedElements = document.select(selector);
                    for (final Element selected : selectedElements) {
                        if (!elementStyles.containsKey(selected)) {
                            elementStyles.put(selected, new LinkedHashMap<>());
                        }

                        final CSSStyleDeclaration styleDeclaration = styleRule.getStyle();

                        for (int j = 0; j < styleDeclaration.getLength(); j++) {
                            final String propertyName = styleDeclaration.item(j);
                            final String propertyValue = styleDeclaration.getPropertyValue(propertyName);
                            final Map<String, String> elementStyle = elementStyles.get(selected);
                            elementStyle.put(propertyName, propertyValue);
                        }
                    }
                }
            }
        }

        for (final Map.Entry<Element, Map<String, String>> elementEntry : elementStyles.entrySet()) {
            final Element element = elementEntry.getKey();
            final StringBuilder builder = new StringBuilder();
            for (final Map.Entry<String, String> styleEntry : elementEntry.getValue().entrySet()) {
                builder.append(styleEntry.getKey()).append(":").append(styleEntry.getValue()).append(";");
            }
            builder.append(element.attr("style"));
            element.attr("style", builder.toString());
            element.removeAttr("class");
        }

        return document.html();
    }
}