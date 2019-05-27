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
    (id, name, is_obligate, quantity)
  VALUES
    (NULL, 'материнская плата', true, 5),
    (NULL, 'звуковая карта', false, 3),
    (NULL, 'процессор', true, 7),
    (NULL, 'подсветка корпуса', false, 2),
    (NULL, 'HDD диск', false, 15),
    (NULL, 'корпус', true, 8),
    (NULL, 'память', true, 12),
    (NULL, 'SSD диск', true, 9),
    (NULL, 'видеокарта', false, 2),
    (NULL, 'клавиатура', false, 5),
    (NULL, 'мышь', false, 7),
    (NULL, 'монитор', false, 3),
    (NULL, 'трекбол', false, 5),
    (NULL, 'DVD привод', false, 2),
    (NULL, 'Blue-ray привод', false, 1),
    (NULL, 'кулер', true, 5),
    (NULL, 'колонки', false, 2),
    (NULL, 'наушники', false, 12),
    (NULL, 'внешний диск', false, 2),
    (NULL, 'Ethernet карта', false, 4),
    (NULL, 'TV-tuner', false, 1),
    (NULL, 'Web-камера', false, 2),
    (NULL, 'HDMI кабель', false, 3),
    (NULL, 'водяное охлаждение', false, 2),
    (NULL, 'видеокарта PRO', false, 2),
    (NULL, 'беспроводной маршрутизатор', false, 5),
    (NULL, '3g модем USB', false, 6),
    (NULL, 'сетевой накопитель NAS', false, 2),
    (NULL, 'источник бесперебойного питания', false, 3),
    (NULL, 'принтер', false, 4);
COMMIT;
