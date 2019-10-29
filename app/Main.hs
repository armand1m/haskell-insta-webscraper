import Lib
import Text.HTML.Scalpel

main :: IO ()
main = do
    contents <- readFile "./fixtures/insta-example.html"
    print $ scrapeStringLike contents scrapeAltTextAndImages 
