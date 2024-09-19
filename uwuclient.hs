import qualified Data.ByteString as BS
import qualified Data.ByteString.Char8 as BS8
import qualified Network.WebSockets as WS
import Data.Word (Word8)
import Data.Time.Clock.POSIX (getPOSIXTime)

-- Define the message type for PING
pingMessageType :: Word8
pingMessageType = 1  -- Assuming 1 represents PING in your case

-- Function to send a PING message with additional data over WebSocket
syncTime :: WS.Connection -> IO ()
syncTime conn = do
    -- Prepare the string as bytes
    let stringData = BS8.pack "abc" -- The string "abc" as a ByteString
        -- Create a ByteString with the message type and string data
        buffer = BS.cons pingMessageType stringData

    -- Get the current time (similar to JavaScript's Date.now())
    sendTime <- round <$> getPOSIXTime

    -- Send the buffer as binary data
    WS.sendBinaryData conn buffer

    -- Store the last ping time (analogous to `this.last_ping_time`)
    putStrLn $ "Last ping time: " ++ show sendTime

main :: IO ()
main = do
    putStrLn "Connecting to WebSocket server..."
    WS.runClient "127.0.0.1" 8080 "/" $ \conn -> do
        putStrLn "Connected to WebSocket server"
        syncTime conn
        putStrLn "Sync time message sent"
