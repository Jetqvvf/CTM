package cols;

public class NCol implements BCol {
    @Override
    public void setCol(Object[] cols) {
        ncol = (Integer[]) cols;
    }

    @Override
    public Integer[] getCol() {
        return ncol;
    }

    private static Integer[] ncol;
}
