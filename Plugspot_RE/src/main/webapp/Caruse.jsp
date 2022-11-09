<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <fieldset class="t3">
        
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js">
            </script>
            <canvas id="chart" class="barchart2"></canvas>





            <script>


                var chart = new Chart('chart', {
                    type: 'horizontalBar',
                    data: {
                        // labels: [],
                        datasets: [
                            {

                                data: [35000],
                                backgroundColor: ['rgb(45,204,106)'],
                                label: '차량등록대수'



                            },
                            {
                                data: [16500],
                                backgroundColor: ['rgb(48,151,219)'],
                                label: '1일이용가능대수'
                            }
                        ]
                    },
                    options: {
                        legend: {
                            display: true,
                            position: 'right',
                            onClick: 'newLegendClickHandler'
                        },
                        responsive: false,
                        scales: {

                            xAxes: [{
                                ticks: {
                                    beginAtZero: true
                                }
                            }]
                        }
                    }
                });
            </script>
    </fieldset>
</body>
</html>