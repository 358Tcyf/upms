package shu.upms.authority.matcher;


import shu.upms.authority.PatternMatcher;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class RegexPatternMatcher implements PatternMatcher {
    @Override
    public boolean match(String url, String path) {
        Pattern pattern = Pattern.compile(path);
        Matcher matcher = pattern.matcher(url);
        return matcher.find();
    }
}
