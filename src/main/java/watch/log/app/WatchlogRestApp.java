package watch.log.app;

import com.aol.micro.server.MicroserverApp;
import com.aol.micro.server.config.Microserver;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Microserver(basePackages = { "watch.log" }, propertiesName = "application.properties")
public class WatchlogRestApp {

    public static void main(String[] args) throws InterruptedException {

        new MicroserverApp(() -> "watchlog-rest-app").run();
    }
}
