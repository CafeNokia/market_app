class CTradeModel {
  final String id;
  final String create_time;
  final String update_time;
  final String date;
  final String code;
  final String name;
  final double new_price;
  final double change_rate;
  final double change_amount;
  final double turnover_volumn;
  final double turnover;
  final double amplitude;
  final double high;
  final double low;
  final double open;
  final double last_close;
  final double volumn_rate;
  final double turnover_rate;
  final double per;
  final double pbr;
  final double mkt_cap;
  final double float_mkt_cap;
  final double acceleration;
  final double five_mins_change;
  final double sixty_days_change;
  final double year_change;
  final double high_10;
  final double low_10;
  final double high_30;
  final double low_30;
  final double turnover_rise;
  final double turnover_rate_rise;
  final double movement;

  CTradeModel({
    required this.id,
    required this.create_time,
    required this.update_time,
    required this.date,
    required this.code,
    required this.name,
    required this.new_price,
    required this.change_rate,
    required this.change_amount,
    required this.turnover_volumn,
    required this.turnover,
    required this.amplitude,
    required this.high,
    required this.low,
    required this.open,
    required this.last_close,
    required this.volumn_rate,
    required this.turnover_rate,
    required this.per,
    required this.pbr,
    required this.mkt_cap,
    required this.float_mkt_cap,
    required this.acceleration,
    required this.five_mins_change,
    required this.sixty_days_change,
    required this.year_change,
    required this.high_10,
    required this.low_10,
    required this.high_30,
    required this.low_30,
    required this.turnover_rise,
    required this.turnover_rate_rise,
    required this.movement
  });

  factory CTradeModel.fromJson(Map<String, dynamic> json) {
    return CTradeModel(
      id: json['id'] ?? '',
      create_time: json['create_time'] ?? '',
      update_time: json['update_time'] ?? '',
      date: json['date'] ?? '',
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      new_price: json['new_price'] ?? '',
      change_rate: json['change_rate'] ?? '',
      change_amount: json['change_amount'] ?? '',
      turnover_volumn: json['turnover_volumn'] ?? '',
      turnover: json['turnover'] ?? '',
      amplitude: json['amplitude'] ?? '',
      high: json['high'] ?? '',
      low: json['low'] ?? '',
      open: json['open'] ?? '',
      last_close: json['last_close'] ?? '',
      volumn_rate: json['volumn_rate'] ?? '',
      turnover_rate: json['turnover_rate'] ?? '',
      per: json['per'] ?? '',
      pbr: json['pbr'] ?? '',
      mkt_cap: json['mkt_cap'] ?? '',
      float_mkt_cap: json['float_mkt_cap'] ?? '',
      acceleration: json['acceleration'] ?? '',
      five_mins_change: json['five_mins_change'] ?? '',
      sixty_days_change: json['sixty_days_change'] ?? '',
      year_change: json['year_change'] ?? '',
      high_10: json['high_10'] ?? '',
      low_10: json['low_10'] ?? '',
      high_30: json['high_30'] ?? '',
      low_30: json['low_30'] ?? '',
      turnover_rise: json['turnover_rise'] ?? '',
      turnover_rate_rise: json['turnover_rate_rise'] ?? '',
      movement: json['movement'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'name': name,
      'code': code,
      'new_price': new_price,
      'change_rate': change_rate,
      'change_amount': change_amount,
      'turnover_volumn': turnover_volumn,
      'turnover': turnover,
      'amplitude': amplitude,
      'high': high,
      'low': low,
      'open': open,
      'last_close': last_close,
      'volumn_rate': volumn_rate,
      'turnover_rate': turnover_rate,
      'per': per,
      'pbr': pbr,
      'mkt_cap': mkt_cap,
      'float_mkt_cap': float_mkt_cap,
      'acceleration': acceleration,
      'five_mins_change': five_mins_change,
      'sixty_days_change': sixty_days_change,
      'year_change': year_change,
      'high_10': high_10,
      'low_10': low_10,
      'high_30': high_30,
      'low_30': low_30,
      'turnover_rise': turnover_rise,
      'turnover_rate_rise': turnover_rate_rise,
      'movement': movement,
    };
  }
}
