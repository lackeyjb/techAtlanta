class StaticPagesController < ApplicationController
  def home
    original = "Launching Spring 2015, Atlanta-based LOV is a new app that helps you find your true love. If youâ\u0080\u0099ve ever tried online dating, then youâ\u0080\u0099re certainly familiar with questionnaires. It uses your social footprint (Facebook posts, bio, comments, etc.) to determine your true personality and matches you with people with whom you are actually compatible."
    @text = original.clean

    original_title = "ATL Native, SCAD Alum &amp; GSU Developer Have Joined Forces to Find You Love"
    @title = original_title.clean
  end
end
