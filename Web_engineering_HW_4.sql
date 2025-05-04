CREATE TABLE weather_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    day_temp INT CHECK (day_temp BETWEEN - 30 AND 30),
    night_temp INT CHECK (night_temp BETWEEN - 30 AND 30),
    wind_speed DECIMAL(5 , 2 ) CHECK (wind_speed >= 0)
);

INSERT INTO weather_data (date, day_temp, night_temp, wind_speed)
VALUES
    (CURDATE() - INTERVAL 5 DAY, 26, 7, 1.5),
    (CURDATE() - INTERVAL 4 DAY, 23, 7, 2),
    (CURDATE() - INTERVAL 3 DAY, 20, 8, 1.3),
    (CURDATE() - INTERVAL 2 DAY, 20, 10, 2.5),
    (CURDATE() - INTERVAL 1 DAY, 29, 6, 1.5);
    
UPDATE weather_data 
SET 
    night_temp = night_temp + 1
WHERE
    wind_speed <= 3;

CREATE VIEW weather_view AS
SELECT 
    id,
    date,
    day_temp,
    night_temp,
    wind_speed,
    (day_temp + night_temp) / 2 AS avg_daily_temp,
    CASE 
        WHEN wind_speed < 2 THEN 'штиль'
        WHEN wind_speed >= 2 AND wind_speed < 5 THEN 'умеренный ветер'
        ELSE 'сильный ветер'
    END AS wind_description
FROM weather_data;