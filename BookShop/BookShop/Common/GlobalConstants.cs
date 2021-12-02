using System;
using System.Collections.Generic;
using System.Text;

namespace BookShop.Common
{
    public class GlobalConstants
    {
        //Author
        public const int AUTHOR_FIRSTNAME_MIN_LENGTH = 3;
        public const int AUTHOR_FIRSTNAME_MAX_LENGTH = 30;

        public const int AUTHOR_LASTNAME_MIN_LENGTH = 3;
        public const int AUTHOR_LASTNAME_MAX_LENGTH = 30;

        public const int AUTHOR_PHONE_MAX_LENGTH = 12;


        //Book
        public const int BOOK_NAME_MIN_LENGTH = 3;
        public const int BOOK_NAME_MAX_LENGTH = 30;

        public const int BOOK_GENRE_MIN_NUMBER = 1;
        public const int BOOK_GENRE_MAX_NUMBER = 3;
        
        public const int BOOK_PAGES_MIN_NUMBER = 50;
        public const int BOOK_PAGES_MAX_NUMBER = 5000;
        
        public const decimal BOOK_PRICE_MIN = 0.01m;
        public const decimal BOOK_PRICE_MAX = decimal.MaxValue;
    }
}
