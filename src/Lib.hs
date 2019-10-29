{-# LANGUAGE OverloadedStrings #-}

module Lib
    (
        scrapeAltTextAndImages,
    ) where

import Text.HTML.Scalpel

scrapeAltTextAndImages :: Scraper String [(String, URL)]
scrapeAltTextAndImages =
    chroots "img" $ do
        url <- attr "src" anySelector
        altText <- attr "alt" anySelector
        let label = if altText /= ""
            then altText
            else "no alt text available"
        return (label, url)