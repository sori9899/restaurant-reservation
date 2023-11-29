package com.example.resreserve;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;
import java.sql.Connection;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
public class JdbcTemplateConnectTest {
    @Autowired
    private DataSource dataSource;

    @Test
    void connectH2() throws Exception {
        Connection connection = dataSource.getConnection();

        assertThat(connection).isNotNull();
    }

    @Test
    void connectJdbcTemplate() {
        JdbcTemplate query = new JdbcTemplate(dataSource);
        Integer result = query.queryForObject("select 1", Integer.class);

        assertThat(result).isEqualTo(1);
    }
}
