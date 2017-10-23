package cols;

public class SCol implements BCol {
    public SCol(String header){
        this.header = header;
        this.scol = new StringBuffer();
    }

    @Override
    public void setCol(Object[] cols) {
        for(int i = 0; i < cols.length; i++)
            scol.append(cols[i]);
    }

    @Override
    public String[] getCol() {
        return scol.toString().split(",");
    }

    public void append(String string) {
        scol.append(string);
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getHeader() {
        return header;
    }

    private StringBuffer scol;
    private String header;
}
