package test.com.moim.board.model;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class Somoim_BoardVO{

    private int num;
    private String title;
    private  String content;
    private String save_image;
    private Timestamp write_date;
    private int view_count;
    private int good_count;
    private int vote_num;
    private int som_member_num;
    private int somoim_num;
    private String user_id;
    private MultipartFile file;
    private String save_name;


}
