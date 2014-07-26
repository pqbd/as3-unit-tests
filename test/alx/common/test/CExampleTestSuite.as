package test.alx.common.test
{
  import alx.common.test.CFrameworkTestSuite;

  public class CExampleTestSuite extends CFrameworkTestSuite
  {
    public function CExampleTestSuite():void
    {
      super();
      this.addTestCaseClass( CExampleTestCase);
    }

    public function testSuite():void
    {
      this.getTester().isTrue( 'true'
                              , true
                              );
    }
  }
}