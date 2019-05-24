from flask import Flask,render_template,json,request
from flask import send_file
from flask import send_file, redirect
import pandas as pd

app=Flask(__name__)

path = '/home/yukyung/mysite/'
enc = 'utf-8'

@app.route("/")
def hello():
    return render_template('index.html')

@app.route('/home')
def home():
    return render_template('index.html')

@app.route('/test')
def home233():
    return render_template('dsdsdsd.html')

@app.route('/generic')
def gen():
    return render_template('generic.html')

@app.route('/rate')
def rate():
    return render_template('DataTipJsFunction.html')

@app.route('/LocationRating')
def lr():
    return render_template('LocationRating2.html')

@app.route('/rMateMapChartH5/Assets/go-up.png', methods=['GET'])
def homes():
    # if request.args.get('type') == '1':
    #     filename = 'static/rMateMapChartH5/Assets/go-up.png'
    filename = 'static/rMateMapChartH5/Assets/go-up.png'
    return send_file(filename, mimetype='png')

@app.route('/data1_final.csv', methods=['GET'])
def homes1():
    # if request.args.get('type') == '1':
    #     filename = 'static/rMateMapChartH5/Assets/go-up.png'
    filename = 'static/data1_final.csv'
    return send_file(filename)

@app.route('/csv_data.csv', methods=['GET'])
def homes3():
    # if request.args.get('type') == '1':
    #     filename = 'static/rMateMapChartH5/Assets/go-up.png'
    filename = 'static/csv_data.csv'
    return send_file(filename)

@app.route('/DataTipJsFunction.html', methods=['GET'])
def homes2():
    return render_template('DataTipJsFunction.html')

@app.route('/simulation')
def simulation():
    return render_template('simulation.html')

@app.route('/simulation_result', methods=['POST'])
def simulation_result():
    city = request.form['city']

    sigu = city.split()
    si = sigu[0]
    gu_gun = sigu[1]

    csize = request.form['csize']
    d_annual_mean = pd.read_csv(path + 'annual_mean.csv', engine='python', encoding=enc)
    dt_am = d_annual_mean[d_annual_mean['city1'] == si]
    dt_am = dt_am[dt_am['city2'] == gu_gun]
    y = list(dt_am['radiation'])
    y_sum = sum(y)
    csize = int(csize)

    d_annual_table = pd.read_csv(path + 'annual_table.csv', engine='python', encoding=enc)
    dt_at = d_annual_table[d_annual_table['city1'] == si]
    dt_at = dt_at[dt_at['city2']== gu_gun]
    dt_at = dt_at.iloc[0]

    z = list(dt_at)
    z_kw = z[4:]

    z_int = []
    for x in z_kw:
        z_int.append(int(x))

    smp = []
    for i in range(25):
        temp = int(csize * z_kw[i] * 0.07997)
        smp.append(temp)

    rec = []
    for i in z_kw:
        rec.append(int(i / 1000 * 98.687 * csize))

    return render_template('simulation_result.html', city=city, si=si, gu_gun=gu_gun, csize=json.dumps(int(csize*y_sum)), y=json.dumps(y), z = json.dumps(z_int), smp = json.dumps(smp), rec = json.dumps(rec))

@app.route('/mr')
def mr():
    return render_template('mr.html')

@app.route('/get_product_list')
def get_product_list():
    df = pd.read_csv(path + 'salse_company.csv', encoding=enc)
    html_str = ''
    for x in range(df.shape[0]):
        one_row = df.loc[x]
        html_str +='<li><div class="deal"><a href="'
        html_str += one_row['url']
        html_str +='"target = "_blank"><div class ="deal-inner"><div class ="img"><img src ="'
        html_str += one_row['image']
        html_str += '"></div><div class="areas"><div class ="title">'
        html_str += one_row['p_name']
        html_str += '</div><div class="prices"><span class="left"><span class="com">업체명-</span><span class="com_name">'
        html_str += one_row['c_name']
        html_str += '</span></span><span class="right"><span class ="num">'
        html_str += one_row['p_price']
        html_str += '</span><span class="unit">원</span></span></div></div><div class ="btns"><button type="button"class ="order_bt"><span class="blind">구매하기</span></button></div></div></a></div></li>'
    return html_str

@app.route('/test')
def test():
    return render_template('test.jsp')

@app.route('/tm')
def tm():
    return render_template('tm.jsp')

@app.route('/market')
def market():
    print('빰빰빰')
    return render_template('market.jsp')

@app.route('/login')
def monitoring_login():
    return render_template('MonitoringLogin.html')

import os
import pandas as pd
@app.route('/monitoring', methods=['POST'])
def check():
    df = pd.read_csv(path + "user.csv", encoding = enc)
    dat = request.form.to_dict()
    uid = dat['id']
    pwd = dat['pw']
    result = (df['PW'][ df['PID']==uid ] == pwd)
    if len(result) == 0:  # id 불일치
        return redirect('/login')

    if int(result):  # id pw 일치 시
        # ID 가져오기
        ID = df[(df['PW'] == uid) & (df['PID'] == pwd)]['ID'][0]

        df2 = pd.read_csv(path + "monitoring_anorm.csv", encoding = enc)
        df_anorm = df2[df2.ID==ID]

        if len(df_anorm) == 0 :
            return redirect('/login')

        Dname = list(df_anorm.DID) # 인버터 이름
        print(len(Dname))
        Devices = len(Dname)  # 인버터 개수
        OnOff = list(df_anorm.OnOff) # 인버터 온오프
        Anorm = list(df_anorm.anorm) # 인버터 이상여부
        cumMP = sum(list(df_anorm.cumMP)) # 월발전량
        cumYP = sum(list(df_anorm.cumYP)) # 연발전량
        cumTP = cumYP * 3.24 # 총발전량

        df_day = pd.read_csv(path + "monitoring_day_fin.csv", encoding = enc)
        df_day_user = df_day[df_day.ID==ID]  # ID에 해당하는 데이터프레임 가져옴
        cumP_day = list(df_day_user.cumDP) # 일별 발전량( 표, 그래프 용도 )
        cumDP = sum(cumP_day) # 일발전량

        df_mon = pd.read_csv(path + "monitoring_month.csv", encoding = enc)
        df_mon_user = df_mon[df_mon.ID==ID] #
        cumP_mon = list(df_mon_user.cumMP)
        print(cumP_mon)

        print("hi")
        # MonitoringResult.html 에서 uid 로 변수를 사용 가능
        return render_template('MonitoringResult.html',
                               uid=uid,  # 유저 아이디
                               Dname=Dname,  # 인버터 이름
                               Devices=Devices,  # 인버터 개수
                               OnOff=OnOff,  # 인버터 온오프 여부
                               Anorm=Anorm,  # 인버터 이상진단 여부
                               cumMP=cumMP,
                               cumYP=cumYP,
                               cumTP=cumTP,
                               cumP_day=cumP_day,  # 일별 발전량
                               cumP_mon=json.dumps(cumP_mon),  # 그래프
                               cumDP=cumDP
                               )
    else:  # pw 불일치
        return redirect('/login')

# @app.route('/sql/')
# def sql():
#     global fCnt
#     # conn = pymysql.connect(host='localhost', user='root', password='1234', db='busa', charset='utf8',
#     #                        autocommit=True)
#     try:
#         # curs = conn.cursor()
#         sql = """SELECT datetime, mscrnc, cnt FROM callfail_rnccnt"""
#         df = pd.read_sql_query(sql, con=pymysql.connect(host='localhost', user='root', password='1111', db='busa', charset='utf8',autocommit=True))
#         # curs.execute(sql)
#         # data = json.dumps(curs.fetchall())
#     finally:
#         # curs.close()
#         # conn.close()
#         resp = df.to_json()
#         df.to_html('./templates/df.html')
#         return render_template('df.html') ## 테이블 html 태그가 들어가네요??

if __name__=="__main__" :
    app.run(host='0.0.0.0', port=5050, debug=None)