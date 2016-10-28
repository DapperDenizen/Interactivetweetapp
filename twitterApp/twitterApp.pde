import java.util.*;
import twitter4j.*;
import twitter4j.auth.*;
import twitter4j.api.*;
import twitter4j.conf.*;

Twitter twitter;
State state;

void setup(){
    size(800, 600);
    //config builder
    ConfigurationBuilder cb = new ConfigurationBuilder();
    //keys input
    cb.setOAuthConsumerKey("rgfw0Sov2FWWjwe402hLcvsP9");
    cb.setOAuthConsumerSecret("GEIH2P9Xufwjv7LamxbaGq69czIb7IPSPhgATzon4h2JDOPvry");
    cb.setOAuthAccessToken("765409286323187712-8oHlwE0eOVfS6cFul3hugh2qIivxuPt");
    cb.setOAuthAccessTokenSecret("KijSNrAo2DyRPpRbJl8qiapP7Ilsyy5prMjSep1wk1KLQ");
    //twtr factory
    TwitterFactory tf = new TwitterFactory(cb.build());

    twitter = tf.getInstance();
    state = new SearchState(); //first screen is searching screen
}

void draw(){
  background(0);
  state = state.doState();
}