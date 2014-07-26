package alx.common.test
{
  /**
   * Unit test framework test suite.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CFrameworkTestSuite extends CTestSuite
  {
    /** Creates framework test suite.*/
    public function CFrameworkTestSuite():void
    {
      super( CUnitTests.getTesterFactory()
            , CUnitTests.getLogFactory()
            );
    }
  }
}