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
        <div class="chart-container">
            <a href="https://www.naver.com">
                <canvas id="myChart" class="chart"></canvas>
            </a>
        </div>
        <script>
            var ctx = document.getElementById('myChart');

            var config = {
                type: 'line',
                data: {
                    labels: [ // Date Objects
                        '서울', '인천', '대전', '대구', '광주', '부산', '울산', '제주'
                    ],
                    datasets: [{
                        label: '완속',
                        backgroundColor: 'rgb(246, 185, 59)',
                        borderColor: 'rgb(246, 185, 59)',
                        fill: false,
                        lineTension: 0,
                        data: [
                            50, 60, 80, 70, 64, 70, 60, 80
                        ],
                    }, {
                        label: '급속',
                        backgroundColor: 'rgb(45, 152, 218)',
                        borderColor: 'rgb(45, 152, 218)',
                        fill: false,
                        lineTension: 0,
                        data: [
                            80, 75, 85, 90, 85, 80, 70, 90
                        ],
                    }]
                },
                options: {
                    legend: {
                        position: 'right',    // 라벨 폰트 색상,크기
                        labels: {
                            fontColor: "black",
                            fontSize: 10
                        }
                    },
                    // maintainAspectRatio: false,
                    responsive: false,
                    title: {
                        text: '시 별 급속/완속 충전기 개수'
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
                    },
                }
            };
            var myChart = new Chart(ctx, config);

        </script>
        <script>
            const myChart = new Chart(
                document.getElementById('myChart'),
                config
            );
        </script>
    </fieldset>
</body>
</html>