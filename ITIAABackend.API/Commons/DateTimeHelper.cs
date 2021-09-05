using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ITIAABackend.API.Commons
{
    public static class DateTimeHelper
    {

        /// <summary>
        /// Cleans a string value into a date
        /// </summary>
        /// <param name="stringValue">A string value which represents the date to clean</param>
        /// <returns>DateTime</returns>
        public static DateTime StringToDateTime(string stringValue)
        {
            DateTime dateValue;
            if (DateTime.TryParse(stringValue, out dateValue)) 
                return dateValue;
            else
                throw new Exception($"Unable to convert {stringValue} to a date.");
         
        }


        /// <summary>
        /// Cleans a date value into a string
        /// </summary>
        /// <param name="dateValue">A date value to string</param>
        /// <returns>DateTime</returns>
        public static string DateToString(DateTime dateValue)
        {
            return dateValue.ToString("dd MMMM yyyy hh:mm:ss");
        }


        /// <summary>
        /// Get current date and time
        /// </summary>
        /// <returns>DateTime</returns>
        public static DateTime CurrentDateTime()
        {
            return DateTime.Now;
        }

    }
}
