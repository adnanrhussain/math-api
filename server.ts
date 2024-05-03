import path from 'path';
import app from '.';

const port = process.env.PORT || 3456;

app.get('/home', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/health', (req, res) => {
  res.header('Cache-Control', `no-store`)
  res.json({ status: 'ok' });
  res.end();
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
