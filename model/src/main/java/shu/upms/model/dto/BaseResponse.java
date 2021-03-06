package shu.upms.model.dto;


public class BaseResponse {
    private String statusCode;

    private String msg;

    private Object object;

    public BaseResponse() {
        this.statusCode = "200";
        this.msg = "请求成功";
    }

    public BaseResponse(Object object){
        this.statusCode = "200";
        this.msg = "请求成功";
        this.object = object;
    }

    public String getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(String statusCode) {
        this.statusCode = statusCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    @Override
    public String toString() {
        return "BaseResponse{" +
                "statusCode='" + statusCode + '\'' +
                ", msg='" + msg + '\'' +
                ", object=" + object +
                '}';
    }
}
