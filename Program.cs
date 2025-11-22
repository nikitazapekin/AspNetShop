var builder = WebApplication.CreateBuilder(args);

// Add services
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure pipeline
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();

// Minimal test endpoints - они точно должны работать
app.MapGet("/", () => "Shop API is running! Check: /test, /api/hello");
app.MapGet("/test", () => new { message = "Direct endpoint works!", status = "OK" });
app.MapGet("/ping", () => "pong");

// Map controllers
app.MapControllers();

app.Run();