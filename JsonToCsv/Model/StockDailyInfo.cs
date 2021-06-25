using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Text.Json.Serialization;

namespace JsonToCsv.Model
{
    public class StockDailyInfo
    {
        [JsonPropertyName("date")]
        public string MarketDate { get; set; }

        [JsonPropertyName("open")]
        public string OpenValue { get; set; }

        [JsonPropertyName("close")]
        public string CloseValue { get; set; }

        [JsonPropertyName("high")]
        public string HighValue { get; set; }

        [JsonPropertyName("low")]
        public string LowValue { get; set; }

        [JsonPropertyName("volume")]
        public string Volume { get; set; }

        [JsonPropertyName("Name")]
        public string TickerSymbol { get; set; }
    }
}
