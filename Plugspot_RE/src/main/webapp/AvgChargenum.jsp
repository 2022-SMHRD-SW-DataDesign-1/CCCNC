<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	 <fieldset>
        <div class="chart-container2">
            <canvas id="myChart3" class="bar-chart"> </canvas>
        </div>

        <script>
            var ctx = document.getElementById('myChart3');

            const config2 = {
                type: 'bar',
                data: {
                    labels: [ // Date Objects
                        '서울', '인천', '대전', '대구', '광주', '부산', '울산', '제주'],
                    datasets: [{
                        label: '완속',
                        backgroundColor: 'rgb(246, 185, 59)',
                        borderColor: 'rgb(246, 185, 59)',
                        data: [80, 70, 60, 75, 80, 50, 65, 70],
                    }, {
                        label: '급속',
                        backgroundColor: 'rgb(45, 152, 218)',
                        borderColor: 'rgb(45, 152, 218)',
                        data: [80, 75, 85, 90, 85, 80, 70, 90],
                    }]
                },
                options: {
                    legend: {
                        position: 'right',
                        fontSize: 8,
                        labels: {
                            fontColor: "black",
                            fontSize: 10
                        }
                    },
                    responsive: false,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'right',
                        },
                        title: {
                            display: true,
                            text: '시 별 충전소의 충전기 평균 개수'
                        },
                        scales: {
                            xAxes: [{
                                stacked: true,
                                ticks: {
                                    fontSize: 8,
                                    fontColor: 'black' // x축 폰트 color

                                },
                                scaleLabel: {
                                    display: true,
                                    fontSize: 9,
                                    labelString: '도시'
                                }
                            }],
                            yAxes: [{
                                ticks: {
                                    fontSize: 8,
                                    fontColor: 'black' // x축 폰트 color
                                },
                                scaleLabel: {
                                    display: true,
                                    fontSize: 9,
                                    labelString: '충전기 개수'
                                }
                            }]
                        }
                    }
                },


            };
            var myChart3 = new Chart(ctx, config2);


        </script>
        <script>
            const myChart3 = new Chart(
                document.getElementById('myChart3'),
                config
            );
        </script>
    </fieldset>
</body>
</html>