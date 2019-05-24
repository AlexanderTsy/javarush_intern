USE test;

DROP TABLE IF EXISTS part;

CREATE TABLE part(
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  is_obligate BOOLEAN NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

START TRANSACTION;
  INSERT INTO part
    (id, name, quantity)
  VALUES
    (NULL, 'материнская плата', 1, 5),
    (NULL, 'звуковая карта', 0, 5),
    (NULL, 'процессор', 1, 5),
    (NULL, 'подсветка корпуса', 0, 5),
    (NULL, 'HDD диск', 0, 5),
    (NULL, 'корпус', 1, 5),
    (NULL, 'память', 1, 5),
    (NULL, 'SSD диск', 1, 5),
    (NULL, 'видеокарта', 0, 5),
    (NULL, 'клавиатура', 1, 5),
    (NULL, 'мышь', 1, 5),
    (NULL, 'монитор', 1, 5),
    (NULL, 'трекбол', 1, 5),
    (NULL, 'DVD привод', 1, 5),
    (NULL, 'Blue-ray привод', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5),
    (NULL, '', 1, 5);

COMMIT;
