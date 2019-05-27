USE test;

DROP TABLE IF EXISTS part;

CREATE TABLE IF NOT EXISTS part(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  is_obligate BOOLEAN NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

START TRANSACTION;
  INSERT INTO part
    (name, is_obligate, quantity)
  VALUES
    ('материнская плата', true, 5),
    ('звуковая карта', false, 3),
    ('процессор', true, 7),
    ('подсветка корпуса', false, 2),
    ('HDD диск', false, 15),
    ('корпус', true, 8),
    ('память', true, 12),
    ('SSD диск', true, 9),
    ('видеокарта', false, 2),
    ('клавиатура', false, 5),
    ('мышь', false, 7),
    ('монитор', false, 3),
    ('трекбол', false, 5),
    ('DVD привод', false, 2),
    ('Blue-ray привод', false, 1),
    ('кулер', true, 5),
    ('колонки', false, 2),
    ('наушники', false, 12),
    ('внешний диск', false, 2),
    ('Ethernet карта', false, 4),
    ('TV-tuner', false, 1),
    ('Web-камера', false, 2),
    ('HDMI кабель', false, 3),
    ('водяное охлаждение', false, 2),
    ('видеокарта PRO', false, 2),
    ('беспроводной маршрутизатор', false, 5),
    ('3g модем USB', false, 6),
    ('сетевой накопитель NAS', false, 2),
    ('источник бесперебойного питания', false, 3),
    ('принтер', false, 4);
COMMIT;
