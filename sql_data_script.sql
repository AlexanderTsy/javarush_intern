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
    (NULL, 'материнская плата', 1, 5),
    (NULL, 'звуковая карта', 0, 3),
    (NULL, 'процессор', 1, 7),
    (NULL, 'подсветка корпуса', 0, 2),
    (NULL, 'HDD диск', 0, 15),
    (NULL, 'корпус', 1, 8),
    (NULL, 'память', 1, 12),
    (NULL, 'SSD диск', 1, 9),
    (NULL, 'видеокарта', 0, 2),
    (NULL, 'клавиатура', 0, 5),
    (NULL, 'мышь', 0, 7),
    (NULL, 'монитор', 0, 3),
    (NULL, 'трекбол', 0, 5),
    (NULL, 'DVD привод', 0, 2),
    (NULL, 'Blue-ray привод', 0, 1),
    (NULL, 'кулер', 1, 5),
    (NULL, 'колонки', 0, 2),
    (NULL, 'наушники', 0, 12),
    (NULL, 'внешний диск', 0, 2),
    (NULL, 'Ethernet карта', 0, 4),
    (NULL, 'TV-tuner', 0, 1),
    (NULL, 'Web-камера', 0, 2),
    (NULL, 'HDMI кабель', 0, 3),
    (NULL, 'водяное охлаждение', 0, 2),
    (NULL, 'видеокарта PRO', 0, 2),
    (NULL, 'беспроводной маршрутизатор', 0, 5),
    (NULL, '3g модем USB', 0, 6),
    (NULL, 'сетевой накопитель NAS', 0, 2),
    (NULL, 'источник бесперебойного питания', 0, 3),
    (NULL, 'принтер', 0, 4);
COMMIT;
