package alx.common.test
{
  /**
   * Test suite.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CTestSuite extends CTestCase
  {
    /** tester factory*/
    private var m_testerFactory:CTesterFactory;
    /** log factory*/
    private var m_logFactory:CLogFactory;
    /** test case storage*/
    private var m_arTestCaseClass:Array;

    /**
     * Creates unit test suite.
     * @param testerFactory {@link alx.common.test.CTesterFactory}
     * @param logFactory {@link alx.common.test.CLogFactory}
     */
    public function CTestSuite( testerFactory:CTesterFactory
                              , logFactory:CLogFactory
                              ):void
    {
      this.setTester( testerFactory.createTester( 'Test Suite'))
          .setLog( logFactory.createLog())
          ;
      this.m_testerFactory = testerFactory;
      this.m_logFactory = logFactory;
      this.m_arTestCaseClass = new Array();
    }

    /**
     * Adds test case class to the suite.
     * @param testCaseClass Class
     * @return {@link alx.common.test.CTestSuite this}
     */
    public function addTestCaseClass( testCaseClass:Class):CTestSuite
    {
      this.m_arTestCaseClass.push( testCaseClass);
      return this;
    }
    public override function start():void
    {
      var bNext:Boolean = true;
      for ( var i:int = 0; (( i < this.m_arTestCaseClass.length) && bNext); i++)
      {
        var testCaseClass:Class = this.m_arTestCaseClass[ i];
        var testCase:CTestCase = new testCaseClass();
        testCase.setTester( this.m_testerFactory.createTester(( testCaseClass as String)))
                .setLog( this.m_logFactory.createLog())
                ;
        try
        {
          testCase.start();
        }
        catch ( e:Error){}
        finally
        {
          if ( testCase.getTester().isError())
          {
            bNext = false;
            testCase.getLog().addLine( testCaseClass+'->fail', CUnitTests.SIMPLE_MODE);
            try
            {
              this.getTester().error( 'suite->fail');
            }
            catch ( e:Error){}
          }
          else
            testCase.getLog().addLine( testCaseClass+'->success', CUnitTests.EXTENDED_MODE);
          this.getLog().addLine( testCase.getLog().toString( 1), CUnitTests.SIMPLE_MODE);
        }
      }
      try
      {
        super.start();
      }
      catch ( e:Error)
      {
        this.getLog().addLine( e.toString(), CUnitTests.SIMPLE_MODE);
        this.getLog().addLine( e.getStackTrace(), CUnitTests.SIMPLE_MODE, true);
      }
      finally
      {
        if ( this.getTester().isError())
          this.getLog().addLine( 'suite->fail', CUnitTests.SIMPLE_MODE);
        else
          this.getLog().addLine( 'suite->success', CUnitTests.EXTENDED_MODE);
      }
    }
  }
}