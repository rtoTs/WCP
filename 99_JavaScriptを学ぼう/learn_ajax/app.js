$(function() {
    $('#btn').on('click', function() {
        $.ajax({
            url: "http://api.openweathermap.org/data/2.5/weather?q=" + $('#cityname').val() + "&units=metric&appid=5475259ec39075ff4beb0b2d7cfb4b68",
            dataType : 'jsonp',
        }).done(function (data){
            //通信成功
            //位置
            $('#place').text(data.name);
            //最高気温 
            $('#temp_max').text(data.main.temp_max);
            //最低気温
            $('#temp_min').text(data.main.temp_min);
            //湿度
            $('#humidity').text(data.main.humidity);
            //風速
            $('#speed').text(data.wind.speed);
            //天気
            $('#weather').text(data.weather[0].main);
            //天気アイコン
            $('img').attr("src","http://openweathermap.org/img/w/" + data.weather[0].icon + ".png");
            $('img').attr("alt", data.weather[0].main);
            
        }).fail(function (data) {
        //通信失敗
            alert("通信に失敗しました。");
        });
    });
});