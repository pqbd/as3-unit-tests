package alx.common.test
{
  import flash.utils.*;

  /**
   * Test case.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CTestCase
  {
    /** Releated tester*/
    private var m_tester:ITester;
    //** Related log*/
    private var m_log:ITestLog;

    /** Creates unit test case.*/
    public function CTestCase():void
    {
      this.setTester( null);
      this.setLog( null);
    }

    /**
     * Sets related tester.
     * @param tester {@link alx.common.test.ITester}
     * @return {@link alx.common.test.CTestCase this}
     */
    public function setTester( tester:ITester):CTestCase
    {
      this.m_tester = tester;
      return this;
    }
    /**
     * Gets related tester.
     * @return {@link alx.common.test.ITester}
     */
    public function getTester():ITester
    {
      return this.m_tester;
    }
    /**
     * Sets related log.
     * @param log {@link alx.common.test.ITestLog}
     * @return {@link alx.common.test.CTestCase this}
     */
    public function setLog( log:ITestLog):CTestCase
    {
      this.m_log = log;
      return this;
    }
    /**
     * Gets related log.
     * @return {@link alx.common.test.ITestLog}
     */
    public function getLog():ITestLog
    {
      return this.m_log;
    }
    /** Runs before each test method.*/
    protected function before():void
    {
    }
    /** Starts unit test.*/
    public function start():void
    {
      if (( this.m_tester !== null) && ( this.m_log != null))
      {
        var bNext = true;
        var type:XML = describeType( this);
        try
        {
          for each ( var node:XML in type..method)
          {
            var strFuctionName:String = node.@name;
            if ( strFuctionName.substr( 0, 4) == 'test')
            {
              try
              {
                this.before();
                this[ strFuctionName].apply( this, null);
              }
              catch( e:Error)
              {
                this.getLog().addLine( e.toString(), CUnitTests.SIMPLE_MODE);
                this.getLog().addLine( e.getStackTrace(), CUnitTests.SIMPLE_MODE, true);
                if ( this.getTester().isError())
                  bNext = false;
                else
                  this.getTester().error( e.getStackTrace());
              }
              finally
              {
                try
                {
                  this.after();
                }
                catch( e:Error)
                {
                  this.getLog().addLine( e.toString(), CUnitTests.SIMPLE_MODE);
                  this.getLog().addLine( e.getStackTrace(), CUnitTests.SIMPLE_MODE, true);
                  this.getTester().error( e.getStackTrace());
                }
                finally
                {
                  if ( this.getTester().isError())
                  {                
                    this.getLog().addLine( strFuctionName+'()->fail', CUnitTests.SIMPLE_MODE);
                  }
                  else
                    this.getLog().addLine( strFuctionName+'()->success', CUnitTests.FULL_MODE);
                }
              }
              if ( !bNext)
                break;
            }
          }
        }
        catch( e:Error)
        { 
          throw e;
        }
        finally
        {
          try
          {
            this.end();
          }
          catch( e:Error)
          {
            this.getLog().addLine( e.toString(), CUnitTests.SIMPLE_MODE);
            this.getLog().addLine( e.getStackTrace(), CUnitTests.SIMPLE_MODE, true);
            this.getTester().error( e.getStackTrace());
          }
        }
      }
      else
        throw Error( 'tester and log must be set');
    }
    /** Runs after each test method.*/
    protected function after():void
    {
    }
    /** Runs at the end of unit test.*/
    protected function end():void
    {
    }
  }
}